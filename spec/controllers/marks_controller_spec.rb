require "rails_helper"

RSpec.describe MarksController, type: :controller do
  let(:team1) { create :team }
  let(:player1) { create :player, team: team1 }
  let(:player2) { create :player, team: team1 }
  let(:player3) { create :player, team: team1 }
  let(:player4) { create :player, team: team1 }
  let(:player5) { create :player, team: team1 }
  let(:player6) { create :player }
  let(:team2) { player6.team }
  let(:game1) { create :game, team_a: team1, team_b: team2 }
  let(:game2) { create :game, team_a: team2, team_b: team1 }
  let(:game3) { create :game, team_a: team1, team_b: team2 }
  let(:game4) { create :game, team_a: team2, team_b: team1 }
  let(:game5) { create :game, team_a: team1, team_b: team2 }
  let(:game6) { create :game, team_a: team2, team_b: team1 }
  let(:mark) { create :mark }
  let(:parsed_response) { JSON.parse(response.body).map(&:deep_symbolize_keys) }
  let(:expected_response) { expected_players.map(&method(:serialized_player)) }

  before do
    [game1, game2, game3, game4, game5, game6].each_with_index do |game, index|
      create(:achievement, player: player1, game: game, mark: mark)
      create(:achievement, player: player6, game: game, mark: mark) if index < 5
      create(:achievement, player: player2, game: game, mark: mark) if index < 4
      create(:achievement, player: player3, game: game, mark: mark) if index < 3
      create(:achievement, player: player4, game: game, mark: mark) if index < 2
      create(:achievement, player: player5, game: game, mark: mark) if index == 0
    end
  end

  def serialized_player(player)
    {
      id: player.id,
      full_name: player.full_name,
      team: {
        id: player.team.id,
        title: player.team.title,
      },
    }
  end

  describe "GET #top" do
    context "team not specified" do
      let(:expected_players) { [player1, player6, player2, player3, player4] }
      let(:expected_response) { expected_players.map(&method(:serialized_player)) }

      it "returns top 5 players for specific mark from all teams" do
        get :top, params: { id: mark.id }

        expect(parsed_response).to eq(expected_response)
      end
    end

    context "team specified" do
      let(:expected_players) { [player1, player2, player3, player4, player5] }

      it "returns top 5 players for specific mark from chosen teams" do
        get :top, params: { id: mark.id, team_id: team1.id }

        expect(parsed_response).to eq(expected_response)
      end
    end
  end
end
