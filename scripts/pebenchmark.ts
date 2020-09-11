import {
  runFile,
  extensionsToLanguage,
  checkFormatSourceFile,
} from "./utils.ts";

import * as path from "https://deno.land/std/path/mod.ts";
import { walkSync, existsSync } from "https://deno.land/std/fs/mod.ts";

import { Markdown } from "https://deno.land/x/deno_markdown/mod.ts";

// Load directory from first command line argument
const directory: string = Deno.args[0];
const problem_number = parseInt(
  path.basename(Deno.realPathSync(directory)).slice(1),
);

// Load answer from `answer.txt` file
let answer: number = parseInt(
  Deno.readTextFileSync(path.join(directory, "answer.txt")),
);

let execution_datas = [];
// Run files and check for correctness
for (const entry of walkSync(directory)) {
  if (entry.isFile && path.extname(entry.name) in extensionsToLanguage) {
    checkFormatSourceFile(entry.path, problem_number);
    let execution_data = await runFile(entry.name, directory, answer);
    execution_datas.push(execution_data);
  }
}

let markdown = new Markdown();

let resultArray = execution_datas.map((item) => {
  const extension: string = path.extname(item["file_name"]);
  return [
    extensionsToLanguage[extension],
    `[${item["file_name"]}](./${item["file_name"]})`,
    item["execution_time"],
  ];
});

resultArray = resultArray.sort((a, b) => {
  // @ts-ignore: Unreachable code error
  return a[2] - b[2];
});

markdown
  .table([
    ["Programming language", "File", "Duration (ms)"],
    ...resultArray,
  ], { align: ["l", "l", "r"] });

// Display markdown to stdout
const md_benchmark = `## Benchmark\n\n${markdown.content}`;
console.log(md_benchmark);
