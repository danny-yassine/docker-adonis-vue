import BaseSchema from '@ioc:Adonis/Lucid/Schema'
import User from 'App/Models/User'

export default class AddUsers extends BaseSchema {
  protected tableName = 'add_users'

  public async up () {
    const user = new User()
    user.password = 'wtv'
    user.email = 'danny@company.org'
    await user.save()
  }

  public async down () {
    //
  }
}
