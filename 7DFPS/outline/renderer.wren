import "luxe: render" for Render, RenderLayerDesc, PassLayerDesc, LoadAction
import "luxe: render" for SortType, ImageDesc, ImageType, PixelFormat

class Renderer {

  construct new() {

    System.print("game / render / init / ok")

  } //new

  ready() {

  }

  tick(delta) {

  }

  render_path(ctx) {

    if(ctx.path == "game") {
      game_render_path(ctx)
    } else if(ctx.path == "ui") {
      ui_render_path(ctx)
    }

  } //render_path

  game_render_path(ctx) {

    var layer = RenderLayerDesc.new()
        layer.dest.color[0].clear_color = ctx.get("clear_color", [1,1,1,1])
        layer.dest.color[0].load_action = LoadAction.clear
        layer.dest.depth.load_action = LoadAction.clear

    ctx.layer_render("default", layer)

  } //game_render_path

  ui_render_path(ctx) {

    var layer = RenderLayerDesc.new()
        layer.dest.color[0].load_action = LoadAction.dont_care
        layer.dest.depth.load_action = LoadAction.clear

    ctx.layer_render("default", layer)

  } //ui_render_path

} //Renderer
