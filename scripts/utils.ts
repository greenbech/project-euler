import * as path from "https://deno.land/std/path/mod.ts";
import { sprintf } from "https://deno.land/std@0.68.0/fmt/printf.ts";

interface ObjectLiteral {
  [key: string]: string;
}

export const extensionsToLanguage: ObjectLiteral = {
  ".py": "Python",
  ".m": "MATLAB/GNU Octave",
  ".jl": "Julia",
};

export async function runFile(
  file_name: string,
  folder: string,
  answer: number,
) {
  // console.log(`Running file ${file_name}`);

  const ext: string = path.extname(file_name);

  let cmds: { [unit: string]: any[] } = {
    ".py": ["python3", file_name],
    ".m": ["octave", file_name],
    ".jl": ["julia", file_name],
  };

  const cmd = cmds[ext];

  const t0 = performance.now();
  const p = Deno.run(
    {
      cmd: cmd,
      cwd: folder,
      stdout: "piped",
    },
  );

  const textDecoder = new TextDecoder();
  const rawOutput = await p.output();
  const t1 = performance.now();

  const value = parseInt(textDecoder.decode(rawOutput));

  if (value !== answer) {
    console.log(
      `❌ Wrong answer with file ${file_name}. Is was ${
        value
      } but should have been ${answer}`,
    );
    Deno.exit(1);
  }

  return {
    "file_name": file_name,
    "value": value,
    "execution_time": Math.round(t1 - t0),
  };
}

export function checkFormatSourceFile(file_name: string, problem_number: number) {
  const text = Deno.readTextFileSync(file_name)

  const file_prefix = `p${sprintf("%1.3d", problem_number)}`  
  if (!path.basename(file_name).startsWith(file_prefix)) {
    console.log(`❌ File ${file_name} did have "${file_prefix}" as prefix`);
    Deno.exit(1)
  }

  if (!text.includes(` Henrik Grønbech; https://projecteuler.net/problem=${problem_number}\n`)) {
    console.log(`❌ File ${file_name} did not include " Henrik Grønbech; https://projecteuler.net/problem=${problem_number}\n"`);
    Deno.exit(1)
  }
}

export function checkFormatReadme(file_name: string, problem_number: number) {
  const text = Deno.readTextFileSync(file_name)

  if (!text.includes(`Problem ${problem_number}:`)) {
    console.log(`❌ File ${file_name} did not include "Problem ${problem_number}"`);
    Deno.exit(1)
  }

  if (!text.includes(`](https://projecteuler.net/problem=${problem_number})`)) {
    console.log(`❌ File ${file_name} did not include "https://projecteuler.net/problem=${problem_number}"`);
    Deno.exit(1)
  }

  if (!text.includes(`## Problem description\n`)) {
    console.log(`❌ File ${file_name} did not include "## Problem description"`);
    Deno.exit(1)
  }

  if (!text.includes(`## Solution\n`)) {
    console.log(`❌ File ${file_name} did not include "## Solution"`);
    Deno.exit(1)
  }

  if (!text.includes(`## Benchmark\n`)) {
    console.log(`❌ File ${file_name} does not include "## Benchmark"`);
    Deno.exit(1)
  }
}