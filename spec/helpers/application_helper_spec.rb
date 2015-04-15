require 'rails_helper'

describe ApplicationHelper do
  describe '#login_bar' do
    subject { login_bar }

    context 'when user is logged' do
      before do
        stub(:user_signed_in?).and_return(true)
      end

      it { is_expected.to eq '<a href="/logout">Sair</a>' }
    end

    context 'when user isnt logged' do
      before do
        stub(:user_signed_in?).and_return(false)
      end

      it { is_expected.to eq '<a href="auth/facebook">Login Facebook</a> | <a href="auth/google_oauth2">Login Google</a>' }

    end
  end
end
