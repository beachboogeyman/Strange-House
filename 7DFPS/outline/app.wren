import "luxe: world" for World, Camera, Entity, Transform
import "luxe: render" for Render
import "luxe: game" for Frame

class App {

  world       { _world }
  ui          { _ui_world }

  camera      { _camera }
  ui_camera   { _ui_camera }

  color       { _color }
  color=(v)   { _color = v }

  width       { Render.window_w() }
  height      { Render.window_h() }
  scale       { Render.drawable_ratio() }

  construct new() {

    _color = [1,1,1,1]

    //create worlds

      _world = World.create("game")
      _ui_world = World.create("ui")

    //create cameras

      _camera = Entity.create(_world, "app.camera")
      Transform.create(_camera)
      Camera.create(_camera)
      Camera.set_default(_world, _camera)

      _ui_camera = Entity.create(_ui_world, "app.ui_camera")
      Transform.create(_ui_camera)
      Camera.create(_ui_camera)
      Camera.set_default(_ui_world, _ui_camera)

    //update our worlds

      Frame.on(Frame.sim) {|delta|
        World.tick(_world, delta)
        World.tick(_ui_world, delta)
      }

    //render our worlds

      Frame.on(Frame.visual) {|delta|
        World.render(_world, _camera, "game", {"clear_color":_color})
        World.render(_ui_world, _ui_camera, "ui")
      }

  } //new

  destroy() {

    //destroy cameras

      Camera.destroy(_camera)
      Camera.destroy(_ui_camera)

      Entity.destroy(_camera)
      Entity.destroy(_ui_camera)

    //destroy worlds

      World.destroy(_ui_world)
      World.destroy(_world)

  } //destroy

} //
