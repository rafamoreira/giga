require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'John', surname: 'Doe', email: 'john@example.com',
                     title: 'Mr', gender: 'male')
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'user invalid without name' do
    @user.name = nil
    assert_not @user.valid?, 'Saved without name'
    assert_equal [:name], @user.errors.keys, 'No validation error for name presence'
  end

  test 'user invalid without surname' do
    @user.surname = nil
    assert_not @user.valid?, 'Saved without surname'
    assert_equal [:surname], @user.errors.keys
  end

  test 'user invalid without title' do
    @user.title = nil
    assert_not @user.valid?, 'Saved without title'
    assert_equal [:title], @user.errors.keys
  end

  test 'user invalid without gender' do
    @user.gender = nil
    assert_not @user.valid?, 'Saved without gender'
    assert_equal [:gender], @user.errors.keys
  end

  test 'user invalid without email' do
    @user.email = nil
    assert_not @user.valid?, 'Saved without email'
    assert_equal [:email], @user.errors.keys
  end

  test 'user invalid with duplicated email' do
    @user.save
    userdup = @user.dup
    assert_not userdup.valid?, "Saved with dup email"
    assert_equal [:email], userdup.errors.keys
  end
end
