import {
  pgEnum,
  pgTable,
  uuid,
  text,
  boolean,
  timestamp,
} from "drizzle-orm/pg-core";
import { game } from "./games";
import { user } from "./users";
import { card } from "./cards";

export const actionEnum = pgEnum("action", [
  "play_card",
  "draw_card",
  "skip_turn",
  "reverse",
  "call_uno",
  "challenge_wild",
]);

export const gameMove = pgTable("game_move", {
  id: uuid("id").primaryKey().notNull(),
  gameId: uuid("game_id")
    .references(() => game.id)
    .notNull(),
  userId: text("user_id")
    .references(() => user.id)
    .notNull(),
  cardId: uuid("card_id").references(() => card.id),
  action: actionEnum().notNull(),
  success: boolean("success").default(true),
  timestamp: timestamp("timestamp").defaultNow(),
});
