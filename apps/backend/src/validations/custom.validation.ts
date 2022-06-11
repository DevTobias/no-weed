import { z } from 'zod';

/**
 * Verifies if the password has a minimal length of 8 chars and contains
 * at least 1 letter and number.
 */
export const password = (value: string, ctx: z.RefinementCtx) => {
  if (value.length < 8) {
    ctx.addIssue({
      code: z.ZodIssueCode.custom,
      message: 'password must be at least 8 characters',
    });
    return;
  }

  if (!value.match(/\d/) || !value.match(/[a-zA-Z]/)) {
    ctx.addIssue({
      code: z.ZodIssueCode.custom,
      message: 'password must contain at least 1 letter and 1 number',
    });
    return;
  }
  return value;
};
