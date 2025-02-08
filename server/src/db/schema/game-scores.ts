import { pgTable, uuid, text, integer } from "drizzle-orm/pg-core";
import { game } from "./games";
import { user } from "./users";

export const gameScore = pgTable("game_score", {
  id: uuid("id").primaryKey().notNull(),
  gameId: uuid("game_id")
    .references(() => game.id)
    .notNull(),
  userId: text("user_id")
    .references(() => user.id)
    .notNull(),
  score: integer("score").notNull(),
  rank: integer("rank").notNull(),
});
