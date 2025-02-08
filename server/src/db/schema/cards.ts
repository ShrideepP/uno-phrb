import { pgEnum, pgTable, uuid, integer } from "drizzle-orm/pg-core";

export const colorEnum = pgEnum("color", [
  "red",
  "blue",
  "green",
  "yellow",
  "wild",
]);

export const valueEnum = pgEnum("value", [
  "0",
  "1",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "skip",
  "reverse",
  "draw_two",
  "wild",
  "wild_draw_four",
]);

export const card = pgTable("card", {
  id: uuid("id").primaryKey().notNull(),
  color: colorEnum().notNull(),
  value: valueEnum().notNull(),
  points: integer("points").notNull(),
});
