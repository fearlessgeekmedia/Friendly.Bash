const { SingleBar } = require('cli-progress');
const readline = require('readline');

const progressBarWidth = 40; // Width of the progress bar
const animationFrames = ['    ', '█   ', '██  ', '███ ', ' ███', '  ██', '   █', '    ']; // Animation frames
let currentFrameIndex = 0; // Current animation frame index

const args = process.argv.slice(2);
const total = args.length > 0 ? parseInt(args[0], 10) : null; // Total number of items (if known)

let progress = 0; // Current progress
const isNumberKnown = total !== null;

// Create a readline interface
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Hide the cursor when the number is unknown
if (!isNumberKnown) {
  rl.output.write('\x1B[?25l');
}

const progressBar = new SingleBar({
  format: `Progress {bar}${isNumberKnown ? ' {percentage}%' : ''}${isNumberKnown ? ' | {value}/{total}' : ''}`,
  barCompleteChar: '\u2588',
  barIncompleteChar: '\u2591'
});

// Function to update the progress bar
const updateProgressBar = () => {
  progress++;
  if (total !== null) {
    // Known number of items
    progressBar.update(progress, { total });
    if (progress === total) {
      progressBar.stop();
      rl.output.write('\x1B[?25h'); // Show the cursor
      process.exit();
    }
  } else {
    // Unknown number of items (animation)
    const animationFrame = animationFrames[currentFrameIndex];
    const progressRatio = progress % progressBarWidth;
    const filledBlocks = '█'.repeat(progressRatio);
    const emptyBlocks = ' '.repeat(progressBarWidth - progressRatio);
    rl.output.write(`\rProgress ${filledBlocks}${emptyBlocks}${animationFrame.slice(-1)}`);
    currentFrameIndex = (currentFrameIndex + 1) % animationFrames.length;
  }
};

// Start the progress bar
progressBar.start(total, 0);

// Listen for data on standard input (piped command output)
process.stdin.on('data', () => {
  updateProgressBar();
});

// Listen for the end of standard input (piped command completed)
process.stdin.on('end', () => {
  progressBar.stop();
  rl.output.write('\x1B[?25h'); // Show the cursor
  process.exit();
});

// Start updating the progress bar every 100 milliseconds
setInterval(updateProgressBar, 100);
