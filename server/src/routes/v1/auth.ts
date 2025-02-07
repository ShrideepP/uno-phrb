import { Hono } from "hono";
import { auth } from "../../config/auth";

export const router = new Hono();

router.on(["POST", "GET"], "/**", (c) => {
  return auth.handler(c.req.raw);
});

export { router as authRoutes };
