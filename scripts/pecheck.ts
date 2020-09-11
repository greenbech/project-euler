import {
  runFile,
  extensionsToLanguage,
  checkFormatSourceFile,
  checkFormatReadme,
} from "./utils.ts";

import * as path from "https://deno.land/std/path/mod.ts";
import { walkSync } from "https://deno.land/std/fs/mod.ts";

// Load directory from first command line argument
const directory: string = Deno.args[0];
const problem_number = parseInt(
  path.basename(Deno.realPathSync(directory)).slice(1),
);

// Load answer from `answer.txt` file
let answer: number = parseInt(
  Deno.readTextFileSync(path.join(directory, "answer.txt")),
);

let error = false;
// Run files and check for correctness
for (const entry of walkSync(directory)) {
  if (entry.isFile) {
    if (entry.name === "README.md") {
      console.log(`Checking file README.md`);
      error = error || checkFormatReadme(entry.path, problem_number);
    } else if (path.extname(entry.name) in extensionsToLanguage) {
      console.log(`Checking file ${entry.name}`);
      checkFormatSourceFile(entry.path, problem_number);
      await runFile(entry.name, directory, answer);
    }
  }
}

if (error) {
  console.log(`❌ Not all checks passed`);
  Deno.exit(1);
} else {
  console.log(`✅ All checks passed`);
}
