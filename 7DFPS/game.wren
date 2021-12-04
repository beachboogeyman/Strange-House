import "luxe: game" for Ready
import "luxe: assets" for Assets
import "luxe: input" for Input, Key
import "luxe: world" for World, Entity, Transform, Sprite, Values, Tags, Camera, Scene
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

    

    _frame = Entity.create(app.world, "frame")
    var frame_mat = Assets.material("assets/material/frame_mat")
    Sprite.create(_frame, frame_mat, 272, 176)
    Transform.create(_frame)
    Transform.set_pos(_frame, 0, 0, 5)
    Sprite.set_origin(_frame, 0, 0)

    _mock = Entity.create(app.world, "mock")
    var mock_mat = Assets.material("assets/material/mock_mat")
    Sprite.create(_mock, mock_mat, 272, 176)
    Transform.create(_mock)
    Transform.set_pos(_mock, 0, 0, 0)
    Sprite.set_origin(_mock, 0, 0)


  } //ready

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
