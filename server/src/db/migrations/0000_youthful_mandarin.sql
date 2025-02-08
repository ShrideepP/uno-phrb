CREATE TYPE "public"."color" AS ENUM('red', 'blue', 'green', 'yellow', 'wild');--> statement-breakpoint
CREATE TYPE "public"."value" AS ENUM('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'skip', 'reverse', 'draw_two', 'wild', 'wild_draw_four');--> statement-breakpoint
CREATE TYPE "public"."action" AS ENUM('play_card', 'draw_card', 'skip_turn', 'reverse', 'call_uno', 'challenge_wild');--> statement-breakpoint
CREATE TYPE "public"."direction" AS ENUM('clockwise', 'counterclockwise');--> statement-breakpoint
CREATE TYPE "public"."max_players" AS ENUM('2', '3', '4');--> statement-breakpoint
CREATE TYPE "public"."status" AS ENUM('waiting', 'active', 'completed');--> statement-breakpoint
CREATE TABLE "card" (
	"id" uuid PRIMARY KEY NOT NULL,
	"color" "color" NOT NULL,
	"value" "value" NOT NULL,
	"points" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE "game_move" (
	"id" uuid PRIMARY KEY NOT NULL,
	"game_id" uuid NOT NULL,
	"user_id" text NOT NULL,
	"card_id" uuid,
	"action" "action" NOT NULL,
	"success" boolean DEFAULT true,
	"timestamp" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "game_player" (
	"id" uuid PRIMARY KEY NOT NULL,
	"game_id" uuid NOT NULL,
	"user_id" text NOT NULL,
	"is_host" boolean DEFAULT false,
	"is_bot" boolean DEFAULT false,
	"hand" text[] NOT NULL,
	"has_called_uno" boolean DEFAULT false,
	"score" integer DEFAULT 0
);
--> statement-breakpoint
CREATE TABLE "game_score" (
	"id" uuid PRIMARY KEY NOT NULL,
	"game_id" uuid NOT NULL,
	"user_id" text NOT NULL,
	"score" integer NOT NULL,
	"rank" integer NOT NULL
);
--> statement-breakpoint
CREATE TABLE "game" (
	"id" uuid PRIMARY KEY NOT NULL,
	"status" "status" NOT NULL,
	"created_by" text NOT NULL,
	"maxPlayers" "max_players" DEFAULT '4',
	"turn_order" uuid[] NOT NULL,
	"current_turn" text NOT NULL,
	"direction" "direction" DEFAULT 'clockwise',
	"draw_pile" text[] NOT NULL,
	"discard_pile" text[] NOT NULL,
	"winner_id" text,
	"created_at" timestamp DEFAULT now(),
	"updated_at" timestamp DEFAULT now()
);
--> statement-breakpoint
CREATE TABLE "account" (
	"id" text PRIMARY KEY NOT NULL,
	"account_id" text NOT NULL,
	"provider_id" text NOT NULL,
	"user_id" text NOT NULL,
	"access_token" text,
	"refresh_token" text,
	"id_token" text,
	"access_token_expires_at" timestamp,
	"refresh_token_expires_at" timestamp,
	"scope" text,
	"password" text,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL
);
--> statement-breakpoint
CREATE TABLE "session" (
	"id" text PRIMARY KEY NOT NULL,
	"expires_at" timestamp NOT NULL,
	"token" text NOT NULL,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL,
	"ip_address" text,
	"user_agent" text,
	"user_id" text NOT NULL,
	CONSTRAINT "session_token_unique" UNIQUE("token")
);
--> statement-breakpoint
CREATE TABLE "user" (
	"id" text PRIMARY KEY NOT NULL,
	"name" text NOT NULL,
	"email" text NOT NULL,
	"email_verified" boolean NOT NULL,
	"image" text,
	"created_at" timestamp NOT NULL,
	"updated_at" timestamp NOT NULL,
	CONSTRAINT "user_email_unique" UNIQUE("email")
);
--> statement-breakpoint
CREATE TABLE "verification" (
	"id" text PRIMARY KEY NOT NULL,
	"identifier" text NOT NULL,
	"value" text NOT NULL,
	"expires_at" timestamp NOT NULL,
	"created_at" timestamp,
	"updated_at" timestamp
);
--> statement-breakpoint
ALTER TABLE "game_move" ADD CONSTRAINT "game_move_game_id_game_id_fk" FOREIGN KEY ("game_id") REFERENCES "public"."game"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "game_move" ADD CONSTRAINT "game_move_user_id_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "game_move" ADD CONSTRAINT "game_move_card_id_card_id_fk" FOREIGN KEY ("card_id") REFERENCES "public"."card"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "game_player" ADD CONSTRAINT "game_player_game_id_game_id_fk" FOREIGN KEY ("game_id") REFERENCES "public"."game"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "game_player" ADD CONSTRAINT "game_player_user_id_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "game_score" ADD CONSTRAINT "game_score_game_id_game_id_fk" FOREIGN KEY ("game_id") REFERENCES "public"."game"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "game_score" ADD CONSTRAINT "game_score_user_id_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "game" ADD CONSTRAINT "game_created_by_user_id_fk" FOREIGN KEY ("created_by") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "game" ADD CONSTRAINT "game_current_turn_user_id_fk" FOREIGN KEY ("current_turn") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "game" ADD CONSTRAINT "game_winner_id_user_id_fk" FOREIGN KEY ("winner_id") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "account" ADD CONSTRAINT "account_user_id_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "session" ADD CONSTRAINT "session_user_id_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."user"("id") ON DELETE no action ON UPDATE no action;