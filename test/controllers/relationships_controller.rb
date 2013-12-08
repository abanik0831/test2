require 'spec_helper'

describe RelationshipsController do

  describe "creating a relationship with Ajax" do

    it "should increment the Relationship count" do
      expect do
        xhr :post, :create, relationship: { followed_id: @profile.id }
      end.to change(Relationship, :count).by(1)
    end

    it "should respond with success" do
      xhr :post, :create, relationship: { followed_id: @profile.id }
      expect(response).to be_success
    end
  end

  describe "destroying a relationship with Ajax" do

    before { @pr.follow!(@profile) }
    let(:relationship) { user.relationships.find_by(followed_id: @profile) }

    it "should decrement the Relationship count" do
      expect do
        xhr :delete, :destroy, id: relationship.id
      end.to change(Relationship, :count).by(-1)
    end

    it "should respond with success" do
      xhr :delete, :destroy, id: relationship.id
      expect(response).to be_success
    end
  end
end