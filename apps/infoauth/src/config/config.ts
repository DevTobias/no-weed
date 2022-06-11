import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import { config as envConfig } from 'dotenv';
import { z } from 'zod';

envConfig({
  path: join(dirname(fileURLToPath(import.meta.url)), '../.env'),
});

const envVarsSchema = z.object({
  NODE_ENV: z
    .union([
      z.literal('production'),
      z.literal('development'),
      z.literal('test'),
    ])
    .default('development'),
  PORT: z
    .string()
    .default('3000')
    .transform((str) => parseInt(str, 10)),
});

const envVars = envVarsSchema.parse(process.env);

export const config = {
  env: envVars.NODE_ENV,
  port: envVars.PORT,
  origins: ['http://localhost:3000'],
};
