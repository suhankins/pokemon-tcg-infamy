BLTAssetManager:CreateEntry("units/menu/menu_scene/infamy_card_df", "texture", ModPath.."assets/units/menu/menu_scene/infamy_card_df.texture", nil)
BLTAssetManager:CreateEntry("units/menu/menu_scene/infamy_card", "object", ModPath.."assets/units/menu/menu_scene/infamy_card.object", nil)
BLTAssetManager:CreateEntry("units/menu/menu_scene/pack0", "texture", ModPath.."assets/units/menu/menu_scene/pack0.texture", nil)
BLTAssetManager:CreateEntry("units/menu/menu_scene/pack1", "texture", ModPath.."assets/units/menu/menu_scene/pack1.texture", nil)
BLTAssetManager:CreateEntry("units/menu/menu_scene/pack2", "texture", ModPath.."assets/units/menu/menu_scene/pack2.texture", nil)

-- We are replacing method that displays rank (infamy level) as text on a card
-- with our code that displays an image instead.
function InfamyCardGui:show_rank(rank)
    self:clear_gui()

    self._data = {
        rank = rank
    }
	
	rank = rank - 1 -- makes calculations easier

    if self._unit:damage() then
        self._unit:damage():run_sequence_simple("enable_card_blank")
    end

    local icon_w = 200 --size of sprite on the card object
    local icon_h = 300

	local width = 245 --size of the card on the atlas texture
	local height = 342

	local pack = math.floor(rank / 176)

	local offset_x = math.fmod(rank, 16) * width
	local offset_y = (math.floor(rank / 16) - pack * 11) * height

    local pokemon_tcg = self._icon_gui:bitmap({
        x = 0,
        y = 0,
        blend_mode = "normal",
        texture = "units/menu/menu_scene/pack" .. pack,
        texture_rect = {
            offset_x,
            offset_y,
            width,
            height
        },
        color = Color.white,
        w = icon_w,
        h = icon_h
    })

    pokemon_tcg:set_render_template(Idstring("OverlayVertexColorTextured"))
end