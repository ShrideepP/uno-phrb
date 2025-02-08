import { pgTable, uuid, text, boolean, integer } from "drizzle-orm/pg-core";
import { game } from "./games";
import { user } from "./users";

export const gamePlayer = pgTable("game_player", {
  id: uuid("id").primaryKey().notNull(),
  gameId: uuid("game_id")
    .references(() => game.id)
    .notNull(),
  userId: text("user_id")
    .references(() => user.id)
    .notNull(),
  isHost: boolean("is_host").default(false),
  isBot: boolean("is_bot").default(false),
  hand: text("hand").array().notNull(),
  hasCalledUno: boolean("has_called_uno").default(false),
  score: integer("score").default(0),
});
