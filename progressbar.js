const { SingleBar } = require('cli-progress');
const readline = require('readline');
const { spawn } = require('child_process');

const progressBarWidth = 40; // Width of the progress bar
const animationFrames = ['    ', '█   ', '██  ', '███ ', ' ███', '  ██', '   █', '    ']; // Animation frames
let currentFrameIndex = 0; // Current animation frame index

const total = 100; // Total number of items (arbitrary value for demonstration)

let progress = 0; // Current progress

// Create a readline interface
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Hide the cursor
rl.output.write('\x1B[?25l');

const progressBar = new SingleBar({
  format: `Progress {bar} {percentage}% | {value}/{total}`,
  barCompleteChar: '\u2588',
  barIncompleteChar: '\u2591',
  hideCursor: false
});

// Function to update the progress bar
const updateProgressBar = () => {
  const animationFrame = animationFrames[currentFrameIndex];
  const progressRatio = progress % progressBarWidth;
  const filledBlocks = '█'.repeat(progressRatio);
  const emptyBlocks = ' '.repeat(progressBarWidth - progressRatio);
  rl.output.write(`\rProgress ${filledBlocks}${emptyBlocks}${animationFrame.slice(-1)}`);
  currentFrameIndex = (currentFrameIndex + 1) % animationFrames.length;
  progress++;
};

// Start the progress bar
progressBar.start(total, 0);

// Start updating the progress bar every 100 milliseconds
const interval = setInterval(updateProgressBar, 100);

// Spawn the ls command and pipe its output to the progress bar
const ls = spawn('ls', ['-l']);

ls.stdout.on('data', (data) => {
  // Process the data received from ls command
  // Update the progress bar accordingly
  // ...

  // In this example, we're incrementing the progress for demonstration purposes
  const lines = data.toString().split('\n').filter(Boolean).length;
  for (let i = 0; i < lines; i++) {
    updateProgressBar();
  }
});

ls.on('close', () => {
  // Stop the progress bar and show the cursor
  progressBar.stop();
  rl.output.write('\x1B[?25h');
  clearInterval(interval);
  process.exit();
});
