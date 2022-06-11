import { z } from 'zod';
import { password } from './custom.validation';

export const signup = z.object({
  body: z.object({
    email: z.string().email(),
    username: z.string(),
    password: z.string().superRefine(password),
    payload: z.string().optional(),
  }),
});

export type SignUp = z.infer<typeof signup>['body'];

export const signin = z.object({
  body: z.object({
    email: z.string(),
    password: z.string(),
  }),
});

export type SignIn = z.infer<typeof signin>['body'];
