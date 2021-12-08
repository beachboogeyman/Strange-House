import "luxe: io" for IO
import "luxe: game" for Game, Frame
import "luxe: assets" for Strings, Assets
import "luxe: input" for Input, Key
import "luxe: math" for Math
import "luxe: world" for World, Entity, Transform, Prototype
import "luxe: world" for Tags, Values, Sprite, Anim, AnimEvent
import "random" for Random

class Scene {

  construct new(world) {

    _world = world

    System.print("hello")

  } //new

  tick(delta) {

  } //tick

  destroy() {

  } //destroy

} //Scene