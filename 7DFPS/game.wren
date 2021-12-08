import "luxe: game" for Ready
import "luxe: assets" for Assets
import "luxe: input" for Input, Key
import "luxe: world" for World, Entity, Transform, Sprite, Anim, Values, Tags, Camera, Scene
import "luxe: math" for Math
import "luxe: draw" for Draw
import "luxe: io" for IO

import "outline/app" for App

class Game is Ready {

  construct ready() {

    super("ready!")

    app = App.new()
    Camera.set2D(app.camera, 0, 0, 272, 176, -25, 25)
    app.color = [0,0,0,1]

    System.print("render size: %(app.width) x %(app.height) @ %(app.scale)x")

    Scene.load(app.world, "test")

    _game_state = "title"
    // title
    // intro
    // maze    (core)
    // battle  (core)
    // explore (core) - post-jam content
    // gameover
    // finale - post-jame content
    // credits
    _player_hp = 6
    _player_hpMax = 6
    _player_hpTemp = 0 // hp = hp + hpTemp. hpTemp -- each full turn
    _pistol_ammo = 5
    _pistol_ammoMax = 5
    _shotgun_ammo = 2
    _shotgun_ammoMax = 2
    _key_items = [false, false, false] // 1 skeleton key, 2 video tape, 3 storybook
    _weapons = [true, false, false] // 1 knife, 2 pistol, 3 shotgun
    _battle_items = [
      0, //1 inventory size (limit = 6)
      0, //2 painkillers - temporarily restores full hp
      0, //3 bandage     - restores small amount of hp, converts hpTemp to hp
      0, //4 tonic       - fully restores turn counter
      0, //5 ammo pack: pistol
      0, //6 ammo pack: shotgun
    ]

    var frame = Entity.create(app.world, "frame")
    var frame_mat = Assets.material("assets/material/frame_mat")
    Sprite.create(frame, frame_mat, 272, 176)
    Transform.create(frame)
    Transform.set_pos(frame, 0, 0, 5)
    Sprite.set_origin(frame, 0, 0)

    var case = Entity.create(app.world, "case")
    var case_mat = Assets.material("assets/material/case_mat")
    Sprite.create(case, case_mat, 272, 176)
    Transform.create(case)
    Transform.set_pos(case, 0, 0, 6)
    Sprite.set_origin(case, 0, 0)

    _log = Entity.create(app.world, "log")
    var log_mat = Assets.material("assets/material/log")
    Sprite.create(_log, log_mat, 112, 32)
    Transform.create(_log)
    Transform.set_pos(_log, 80, 16, 3)
    Sprite.set_origin(_log, 0, 0)
    whiteLog(1)
     

    return_to_title()
    Entity.destroy(_title)
    return_to_title()

    

  } //ready

  return_to_title(){
    _title = Entity.create(app.world, "state_title")
    var state_title = Assets.material("assets/material/state_title")
    Sprite.create(_title, state_title, 176, 96)
    Sprite.set_uv(_title, 0,0,0.0769230769, 1)
    Anim.create(_title)
    Anim.play(_title, "anim/title")
    Transform.create(_title)
    Transform.set_pos(_title, 48, 48, 0)
    Sprite.set_origin(_title, 0, 0)
  }

  whiteLog(num){
    Sprite.set_uv(_log, num/20, 0, (num + 1)/20, 1)
  }

  tick(delta) {

    var pos = Camera.screen_point_to_world(app.camera, Input.mouse_x(), Input.mouse_y())
    

    if(Input.key_state_released(Key.escape)) {
      IO.shutdown()
    }

    

  } //tick

  destroy() {

    System.print("unready!")
    app.destroy()

  } //destroy

  app { _app }
  app=(v) { _app=v }

} //Game
