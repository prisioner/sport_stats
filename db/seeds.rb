2.times do
  team = Team.create(title: Faker::Team.name)

  5.times { team.players.create(full_name: Faker::Name.name) }
end

2.times do
  Game.create(
    team_a: Team.first,
    team_b: Team.last,
    game_started_at: Faker::Time.between(from: 60.days.ago, to: 1.day.ago),
  )
end

Game.create(
  team_a: Team.last,
  team_b: Team.first,
  game_started_at: Faker::Time.between(from: 60.days.ago, to: 1.day.ago),
)

mark1 = Mark.create(title: "пробежал 10+ км")
mark2 = Mark.create(title: "сделал 70+ % точных передач")

5.times do
  Achievement.find_or_create_by(mark: mark1, game: Game.order("RANDOM()").first, player: Player.order("RANDOM()").first)
  Achievement.find_or_create_by(mark: mark2, game: Game.order("RANDOM()").first, player: Player.order("RANDOM()").first)
end
