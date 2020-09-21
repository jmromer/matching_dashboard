# frozen_string_literal: true

[
  Pairing,
  Client,
  Expert,
  User,
].each(&:delete_all)

names = [
  "Victor Davis Hanson",
  "Emily Dickinson",
  "Edna St. Vincent Millay",
  "Jean-Paul Sartre",
  "Simone de Beauvoir",
  "Max Weber",
  "Bobby Fischer",
  "Felix Mendelssohn",
  "Claude Debussy",
  "Jane Austen",
  "Yukio Mishima",
  "Friedrich Nietzsche",
  "Martin Heidegger",
  "Emily Bronte",
  "James Salter",
  "Kingsley Amis",
]

users = names.map { |name| User.create(name: name) }
clients, experts = users.each_slice(users.length / 2).entries

clients.map! { |client| Client.create(user: client) }
experts.map! { |expert| Expert.create(user: expert) }

clients.first(2).zip(experts.last(2)) do |client, expert|
  Pairing.create(expert: expert, client: client)
end
