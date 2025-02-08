import { pgEnum, pgTable, uuid, text, timestamp } from "drizzle-orm/pg-core";
import { user } from "./users";

export const statusEnum = pgEnum("status", ["waiting", "active", "completed"]);

export const maxPlayersEnum = pgEnum("max_players", ["2", "3", "4"]);

export const directionEnum = pgEnum("direction", [
  "clockwise",
  "counterclockwise",
]);

export const game = pgTable("game", {
  id: uuid("id").primaryKey().notNull(),
  status: statusEnum().notNull(),
  createdBy: text("created_by")
    .references(() => user.id)
    .notNull(),
  maxPlayers: maxPlayersEnum().default("4"),
  turnOrder: uuid("turn_order").array().notNull(),
  currentTurn: text("current_turn")
    .references(() => user.id)
    .notNull(),
  direction: directionEnum().default("clockwise"),
  drawPile: text("draw_pile").array().notNull(),
  discardPile: text("discard_pile").array().notNull(),
  winnerId: text("winner_id").references(() => user.id),
  createdAt: timestamp("created_at").defaultNow(),
  updatedAt: timestamp("updated_at").defaultNow(),
});
