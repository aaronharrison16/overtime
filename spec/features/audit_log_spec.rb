require 'rails_helper'

describe 'AuditLog Feature' do 
  before do 
    admin_user = FactoryBot.create(:admin_user)
    login_as(admin_user, :scope => :user)
    FactoryBot.create(:audit_log)
  end

  describe 'index' do 
    it 'has an index page that can be reached' do 
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it 'renders audit log content' do 
      visit audit_logs_path
      expect(page).to have_content(/SWANSON, RON/)
    end

    it 'cannot be accessed by a non-admin user' do 
      logout(:user)
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)

      visit audit_logs_path

      expect(current_path).to eq(root_path)
    end
  end
end