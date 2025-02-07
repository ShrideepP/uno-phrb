import { Hono } from "hono";
import { logger } from "hono/logger";
import { cors } from "hono/cors";
import { authRoutes } from "./routes/v1/auth";

const app = new Hono();

app.use("*", logger());
app.use(
  "/api/*",
  cors({ origin: process.env.CLIENT_BASE_URL!, credentials: true })
);

app.basePath("/api").route("/auth", authRoutes);

export default app;
