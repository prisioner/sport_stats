require "rails_helper"

RSpec.describe PlayersController, type: :controller do
  let(:team1) { create :team }
  let(:player) { create :player, team: team1 }
  let!(:game1) { create :game, team_a: team1 }
  let!(:game2) { create :game, team_b: team1 }
  let!(:game3) { create :game, team_a: team1 }
  let!(:game4) { create :game, team_b: team1 }
  let!(:game5) { create :game, team_a: team1 }
  let!(:game6) { create :game, team_b: team1, game_started_at: 1.year.ago }
  let(:mark) { create :mark }
  let(:parsed_response) { JSON.parse(response.body).deep_symbolize_keys }

  describe "POST #complete_mark" do
    let(:expected_response) do
      {
        mark: {
          id: mark.id,
          title: mark.title,
        },
        player: {
          id: player.id,
          full_name: player.full_name,
        },
        game: {
          id: game1.id,
          game_started_at: game1.game_started_at.iso8601,
        },
      }
    end

    context "achievement not created yet" do
      it "creates achievement in database" do
        expect { post :complete_mark, params: { id: player.id, mark_id: mark.id, game_id: game1.id } }.to change(Achievement, :count).by(1)
      end

      it "returns achievement details" do
        post :complete_mark, params: { id: player.id, mark_id: mark.id, game_id: game1.id }

        expect(parsed_response.except(:id)).to eq(expected_response)
      end
    end

    context "achievement already exists" do
      let!(:achievement) { create(:achievement, player: player, mark: mark, game: game1) }
      let(:expected_response) do
        super().merge(id: achievement.id)
      end

      it "does not create achievement in database" do
        expect { post :complete_mark, params: { id: player.id, mark_id: mark.id, game_id: game1.id } }.not_to change(Achievement, :count)
      end

      it "returns achievement details" do
        post :complete_mark, params: { id: player.id, mark_id: mark.id, game_id: game1.id }

        expect(parsed_response).to eq(expected_response)
      end
    end
  end
  
  describe "GET #check_mark_completion" do
    context "player achieves mark in last 5 matches" do
      let!(:achievement) { create(:achievement, mark: mark, player: player, game: game3) }

      it "returns true" do
        get :check_mark_completion, params: { id: player.id, mark_id: mark.id }

        expect(parsed_response).to eq({ mark_completed: true })
      end
    end

    context "player doesn't achieve mark in last 5 matches" do
      let!(:achievement) { create(:achievement, mark: mark, player: player, game: game6) }

      it "returns false" do
        get :check_mark_completion, params: { id: player.id, mark_id: mark.id }

        expect(parsed_response).to eq({ mark_completed: false })
      end
    end
  end
end
