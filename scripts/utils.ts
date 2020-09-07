import * as path from "https://deno.land/std/path/mod.ts";

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
      `Wrong answer with file ${file_name}. Is was ${
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
