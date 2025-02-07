import { betterAuth } from "better-auth";
import { drizzleAdapter } from "better-auth/adapters/drizzle";
import { db } from "./database";
import * as schema from "../db/schema";
import { openAPI } from "better-auth/plugins";
import { sendResetPassword, sendVerificationEmail } from "./email";

export const auth = betterAuth({
  database: drizzleAdapter(db, {
    provider: "pg",
    schema,
  }),
  plugins: [openAPI()],
  trustedOrigins: [process.env.CLIENT_BASE_URL!],
  emailAndPassword: {
    enabled: true,
    sendResetPassword,
    requireEmailVerification: true,
  },
  emailVerification: {
    sendVerificationEmail,
    sendOnSignUp: true,
    autoSignInAfterVerification: true,
  },
  rateLimit: {
    enabled: true,
    customRules: {
      "/sign-up/email": {
        window: 60,
        max: 5,
      },
      "/send-verification-email": {
        window: 60,
        max: 5,
      },
      "/forget-password": {
        window: 60,
        max: 5,
      },
    },
  },
});
