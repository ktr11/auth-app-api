# userオブジェクトの各フィールドの形式等を定義
class User < ApplicationRecord
  before_save :downcase_email
  # email の validation
  VALID_EMAIL_REGEX =
    /\A[a-z\d]+[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates(:email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false })
  # passwordのvalidation セキュアなパスワード
  has_secure_password
  validates(:password, presence: true, length: { minimum: 6 }, allow_nil: true)

  private

    # メールアドレスを小文字に変更
    def downcase_email
      email.downcase!
    end
end
