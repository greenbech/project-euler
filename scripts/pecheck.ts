import { runFile, extensionsToLanguage, checkFormatSourceFile, checkFormatReadme } from "./utils.ts";

import * as path from "https://deno.land/std/path/mod.ts";
import { walkSync } from "https://deno.land/std/fs/mod.ts";

// Load directory from first command line argument
const directory: string = Deno.args[0] === "." ?  Deno.cwd() : Deno.args[0];
const problem_number = parseInt(path.basename(directory).slice(1))

// Load answer from `answer.txt` file
let answer: number = parseInt(
  Deno.readTextFileSync(path.join(directory, "answer.txt")),
);

// Run files and check for correctness
for (const entry of walkSync(directory)) {
  if (entry.isFile) {
    if (entry.name === "README.md") {
        console.log(`Checking file README.md`)
        checkFormatReadme(entry.path, problem_number)
    } else if (path.extname(entry.name) in extensionsToLanguage) {
        console.log(`Checking file ${entry.name}`);
        checkFormatSourceFile(entry.path, problem_number);
        await runFile(entry.name, directory, answer);
    }
  }
}

console.log(`✅ All checks passed`);
