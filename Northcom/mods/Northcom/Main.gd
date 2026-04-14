extends Node

var modifiedRes: Array = []
var icon_textures: Dictionary = {}

const ITEMS = [
    {
        "file": "Jacket_M88",
        "tres": "res://Items/Clothing/Jacket_M88/Jacket_M88.tres",
        "body_material": "res://Items/Clothing/Jacket_M88/Files/MT_Jacket_M88.tres",
        "sleeve_material": "res://Items/Clothing/Jacket_M88/Files/MT_Jacket_M88_Sleeves_PBR.tres",
        "body_albedo": "res://Items/Clothing/Jacket_M88/Files/TX_Jacket_M88_AL.png",
        "sleeve_albedo": "res://Items/Clothing/Jacket_M88/Files/TX_Jacket_M88_Sleeves_AL.png",
        "sleeve_normal": "res://Items/Clothing/Jacket_M88/Files/TX_Jacket_M88_Sleeves_NR.png",
        "sleeve_ao": "res://Items/Clothing/Jacket_M88/Files/TX_Jacket_M88_Sleeves_AO.png",
        "sleeve_roughness": "res://Items/Clothing/Jacket_M88/Files/TX_Jacket_M88_Sleeves_RG.png",
        "icon": "res://Items/Clothing/Jacket_M88/Files/Icon_Jacket_M88.png",
    },
    {
        "file": "Jacket_FJ",
        "tres": "res://Items/Clothing/Jacket_FJ/Jacket_FJ.tres",
        "body_material": "res://Items/Clothing/Jacket_FJ/Files/MT_Jacket_FJ.tres",
        "sleeve_material": "res://Items/Clothing/Jacket_FJ/Files/MT_Jacket_FJ_Sleeves_PBR.tres",
        "body_albedo": "res://Items/Clothing/Jacket_FJ/Files/TX_Jacket_FJ_AL.png",
        "sleeve_albedo": "res://Items/Clothing/Jacket_FJ/Files/TX_Jacket_FJ_Sleeves_AL.png",
        "sleeve_normal": "res://Items/Clothing/Jacket_FJ/Files/TX_Jacket_FJ_Sleeves_NR.png",
        "sleeve_ao": "res://Items/Clothing/Jacket_FJ/Files/TX_Jacket_FJ_Sleeves_AO.png",
        "sleeve_roughness": "res://Items/Clothing/Jacket_FJ/Files/TX_Jacket_FJ_Sleeves_RG.png",
        "icon": "res://Items/Clothing/Jacket_FJ/Files/Icon_Jacket_FJ.png",
    },
    {
        "file": "Jacket_M81",
        "tres": "res://Items/Clothing/Jacket_M81/Jacket_M81.tres",
        "body_material": "res://Items/Clothing/Jacket_M81/Files/MT_Jacket_M81.tres",
        "sleeve_material": "res://Items/Clothing/Jacket_M81/Files/MT_Jacket_M81_Sleeves_PBR.tres",
        "body_albedo": "res://Items/Clothing/Jacket_M81/Files/TX_Jacket_M81_AL.png",
        "sleeve_albedo": "res://Items/Clothing/Jacket_M81/Files/TX_Jacket_M81_Sleeves_AL.png",
        "sleeve_normal": "res://Items/Clothing/Jacket_M81/Files/TX_Jacket_M81_Sleeves_NR.png",
        "sleeve_ao": "res://Items/Clothing/Jacket_M81/Files/TX_Jacket_M81_Sleeves_AO.png",
        "sleeve_roughness": "res://Items/Clothing/Jacket_M81/Files/TX_Jacket_M81_Sleeves_RG.png",
        "icon": "res://Items/Clothing/Jacket_M81/Files/Icon_Jacket_M81.png",
    },
    {
        "file": "Helmet_Wz63",
        "tres": "res://Items/Helmets/Helmet_Wz63/Helmet_Wz63.tres",
        "body_material": "res://Items/Helmets/Helmet_Wz63/Files/MT_Helmet_Wz63.tres",
        "sleeve_material": "",
        "body_albedo": "res://Items/Helmets/Helmet_Wz63/Files/TX_Helmet_Wz63_AL.png",
        "sleeve_albedo": "",
        "sleeve_normal": "",
        "normal": "res://Items/Helmets/Helmet_Wz63/Files/TX_Helmet_Wz63_NR.png",
        "icon": "res://Items/Helmets/Helmet_Wz63/Files/Icon_Helmet_Wz63.png",
    },
    {
        "file": "Balaclava",
        "tres": "res://Items/Clothing/Balaclava/Balaclava.tres",
        "body_material": "res://Items/Clothing/Balaclava/Files/MT_Balaclava.tres",
        "sleeve_material": "",
        "body_albedo": "res://Items/Clothing/Balaclava/Files/TX_Balaclava_AL.png",
        "sleeve_albedo": "",
        "sleeve_normal": "",
        "normal": "res://Items/Clothing/Balaclava/Files/TX_Balaclava_NR.png",
        "icon": "res://Items/Clothing/Balaclava/Files/Icon_Balaclava.png",
    },
    {
        "file": "Vest_FJ_Armored",
        "tres": "res://Items/Rigs/Vest_FJ_Armored/Vest_FJ_Armored.tres",
        "body_material": "res://Items/Rigs/Vest_FJ_Armored/Files/MT_Vest_FJ_Armored.tres",
        "sleeve_material": "",
        "body_albedo": "res://Items/Rigs/Vest_FJ_Armored/Files/TX_Vest_FJ_Armored_AL.png",
        "sleeve_albedo": "",
        "sleeve_normal": "",
        "normal": "res://Items/Rigs/Vest_FJ_Armored/Files/TX_Vest_FJ_Armored_NR.png",
        "icon": "res://Items/Rigs/Vest_FJ_Armored/Files/Icon_Vest_FJ_Armored.png",
    },
    {
        "file": "Vest_FJ",
        "tres": "res://Items/Rigs/Vest_FJ/Vest_FJ.tres",
        "body_material": "res://Items/Rigs/Vest_FJ/Files/MT_Vest_FJ.tres",
        "sleeve_material": "",
        "body_albedo": "res://Items/Rigs/Vest_FJ/Files/TX_Vest_FJ_AL.png",
        "sleeve_albedo": "",
        "sleeve_normal": "",
        "normal": "res://Items/Rigs/Vest_FJ/Files/TX_Vest_FJ_NR.png",
        "icon": "res://Items/Rigs/Vest_FJ/Files/Icon_Vest_FJ.png",
    },
    {
        "file": "Colt_727",
        "tres": "res://Items/Weapons/Colt_727/Colt_727.tres",
        "body_material": "res://Items/Weapons/Colt_727/Files/MT_Colt_727.tres",
        "sleeve_material": "",
        "body_albedo": "res://Items/Weapons/Colt_727/Files/TX_Colt_727_AL.png",
        "sleeve_albedo": "",
        "sleeve_normal": "",
        "normal": "res://Items/Weapons/Colt_727/Files/TX_Colt_727_NR.png",
        "icon": "res://Items/Weapons/Colt_727/Files/Icon_Colt_727.png",
    },
    {
        "file": "Pants_FJ",
        "tres": "res://Items/Clothing/Pants_FJ/Pants_FJ.tres",
        "body_material": "res://Items/Clothing/Pants_FJ/Files/MT_Pants_FJ.tres",
        "sleeve_material": "",
        "body_albedo": "res://Items/Clothing/Pants_FJ/Files/TX_Pants_FJ_AL.png",
        "sleeve_albedo": "",
        "sleeve_normal": "",
        "icon": "res://Items/Clothing/Pants_FJ/Files/Icon_Pants_FJ.png",
    },
    {
        "file": "Pants_M88",
        "tres": "res://Items/Clothing/Pants_M88/Pants_M88.tres",
        "body_material": "res://Items/Clothing/Pants_M88/Files/MT_Pants_M88.tres",
        "sleeve_material": "",
        "body_albedo": "res://Items/Clothing/Pants_M88/Files/TX_Pants_M88_AL.png",
        "sleeve_albedo": "",
        "sleeve_normal": "",
        "icon": "res://Items/Clothing/Pants_M88/Files/Icon_Pants_M88.png",
    },
    {
        "file": "Pants_M81",
        "tres": "res://Items/Clothing/Pants_M81/Pants_M81.tres",
        "body_material": "res://Items/Clothing/Pants_M81/Files/MT_Pants_M81.tres",
        "sleeve_material": "",
        "body_albedo": "res://Items/Clothing/Pants_M81/Files/TX_Pants_M81_AL.png",
        "sleeve_albedo": "",
        "sleeve_normal": "",
        "icon": "res://Items/Clothing/Pants_M81/Files/Icon_Pants_M81.png",
    },
    {
        "file": "Boots_FJ",
        "tres": "res://Items/Clothing/Boots_FJ/Boots_FJ.tres",
        "body_material": "res://Items/Clothing/Boots_FJ/Files/MT_Boots_FJ.tres",
        "sleeve_material": "",
        "body_albedo": "res://Items/Clothing/Boots_FJ/Files/TX_Boots_FJ_AL.png",
        "sleeve_albedo": "",
        "sleeve_normal": "",
        "normal": "res://Items/Clothing/Boots_FJ/Files/TX_Boots_FJ_NR.png",
        "icon": "res://Items/Clothing/Boots_FJ/Files/Icon_Boots_FJ.png",
    },
    {
        "file": "Boots_Jungle",
        "tres": "res://Items/Clothing/Boots_Jungle/Boots_Jungle.tres",
        "body_material": "res://Items/Clothing/Boots_Jungle/Files/MT_Boots_Jungle.tres",
        "sleeve_material": "",
        "body_albedo": "res://Items/Clothing/Boots_Jungle/Files/TX_Boots_Jungle_AL.png",
        "sleeve_albedo": "",
        "sleeve_normal": "",
        "normal": "res://Items/Clothing/Boots_Jungle/Files/TX_Boots_Jungle_NR.png",
        "icon": "res://Items/Clothing/Boots_Jungle/Files/Icon_Boots_Jungle.png",
    },
    {
        "file": "Vest_Lifchik",
        "tres": "res://Items/Rigs/Vest_Lifchik/Vest_Lifchik.tres",
        "body_material": "res://Items/Rigs/Vest_Lifchik/Files/MT_Vest_Lifchik.tres",
        "sleeve_material": "",
        "body_albedo": "res://Items/Rigs/Vest_Lifchik/Files/TX_Vest_Lifchik_AL.png",
        "sleeve_albedo": "",
        "sleeve_normal": "",
        "normal": "res://Items/Rigs/Vest_Lifchik/Files/TX_Vest_Lifchik_NR.png",
        "icon": "res://Items/Rigs/Vest_Lifchik/Files/Icon_Vest_Lifchik.png",
    },
    {
        "file": "TG_Faust",
        "tres": "res://Items/Rigs/TG_Faust/TG_Faust.tres",
        "body_material": "res://Items/Rigs/TG_Faust/Files/MT_TG_Faust.tres",
        "sleeve_material": "",
        "body_albedo": "res://Items/Rigs/TG_Faust/Files/TX_TG_Faust_AL.png",
        "sleeve_albedo": "",
        "sleeve_normal": "",
        "normal": "res://Items/Rigs/TG_Faust/Files/TX_TG_Faust_NR.png",
        "icon": "res://Items/Rigs/TG_Faust/Files/Icon_TG_Faust.png",
    },
    {
        "file": "Vest_6B5",
        "tres": "res://Items/Rigs/Vest_6B5/Vest_6B5.tres",
        "body_material": "res://Items/Rigs/Vest_6B5/Files/MT_Vest_6B5.tres",
        "sleeve_material": "",
        "body_albedo": "res://Items/Rigs/Vest_6B5/Files/TX_Vest_6B5_AL.png",
        "sleeve_albedo": "",
        "sleeve_normal": "",
        "normal": "res://Items/Rigs/Vest_6B5/Files/TX_Vest_6B5_NR.png",
        "icon": "res://Items/Rigs/Vest_6B5/Files/Icon_Vest_6B5.png",
    },
]

const GLOVES = [
    {
        "file": "Gloves_Nomex",
        "tres": "res://Items/Clothing/Gloves_Nomex/Gloves_Nomex.tres",
        "material": "res://Items/Clothing/Gloves_Nomex/Files/MT_Gloves_Nomex_PBR.tres",
        "albedo": "res://Items/Clothing/Gloves_Nomex/Files/TX_Gloves_Nomex_AL.png",
        "normal": "res://Items/Clothing/Gloves_Nomex/Files/TX_Gloves_Nomex_NR.png",
        "ao": "res://Items/Clothing/Gloves_Nomex/Files/TX_Gloves_Nomex_AO.png",
        "roughness": "res://Items/Clothing/Gloves_Nomex/Files/TX_Gloves_Nomex_RG.png",
        "icon_ctex": "res://.godot/imported/Icon_Gloves_Nomex.png-ae649e20e5a0964d3246cbb74e307fd0.s3tc.ctex",
    },
    {
        "file": "Gloves_Knit",
        "tres": "res://Items/Clothing/Gloves_Knit/Gloves_Knit.tres",
        "material": "res://Items/Clothing/Gloves_Knit/Files/MT_Gloves_Knit_PBR.tres",
        "albedo": "res://Items/Clothing/Gloves_Knit/Files/TX_Gloves_Knit_AL.png",
        "normal": "res://Items/Clothing/Gloves_Knit/Files/TX_Gloves_Knit_NR.png",
        "ao": "res://Items/Clothing/Gloves_Knit/Files/TX_Gloves_Knit_AO.png",
        "roughness": "res://Items/Clothing/Gloves_Knit/Files/TX_Gloves_Knit_RG.png",
        "icon_ctex": "res://.godot/imported/Icon_Gloves_Knit.png-b8c3d4730f5d488ca48c8af95996f434.s3tc.ctex",
    },
    {
        "file": "Gloves_Soviet",
        "tres": "res://Items/Clothing/Gloves_Soviet/Gloves_Soviet.tres",
        "material": "res://Items/Clothing/Gloves_Soviet/Files/MT_Gloves_Soviet_PBR.tres",
        "albedo": "res://Items/Clothing/Gloves_Soviet/Files/TX_Gloves_Soviet_AL.png",
        "normal": "res://Items/Clothing/Gloves_Soviet/Files/TX_Gloves_Soviet_NR.png",
        "ao": "res://Items/Clothing/Gloves_Soviet/Files/TX_Gloves_Soviet_AO.png",
        "roughness": "res://Items/Clothing/Gloves_Soviet/Files/TX_Gloves_Soviet_RG.png",
        "icon_ctex": "res://.godot/imported/Icon_Gloves_Soviet.png-880237844183d6690618da6637420970.s3tc.ctex",
    },
]

const REMOVED_ITEMS = [
    "Glock_17", "Glock_17_Magazine",
    "P320", "P320_Magazine",
    "MP7", "MP7_Magazine",
    "AK_12", "AK_12_Magazine",
    "KAR_21", "KAR_21_Barrel", "KAR_21_223", "KAR_21_223_Magazine", "KAR_21_308", "KAR_21_308_Magazine",
    "MK18",
    "HK416",
    "RK_95",
    "M4A1",
    "K19",
    "LVPC_Green", "LVPC_M05", "LVPC_Winter",
    "Armor_Plate_III+", "Armor_Plate_IV",
    "ACOG", "EXPS", "HMR", "Hybrid", "MRO", "PRO", "SOCOM", "Thor", "Vudu",
    "ANPEQ", "RMR", "SRO", "Navy", "Monster", "Micro", "Leopard", "Kobra",
    "OZ5", "PTN", "Rider", "Salvo",
]

var colt727_rig_mat: ShaderMaterial = null

func _ready():
    await get_tree().process_frame
    await get_tree().process_frame

    var db = get_node_or_null("/root/Database")
    if db == null:
        push_warning("[Northcom] Database not found!")
        return

    var db_script = load("res://mods/Northcom/DatabaseOverride.gd")
    db_script.reload()
    db.set_script(db_script)
    print("[Northcom] Database overridden OK")

    var loot_table = ResourceLoader.load("res://Loot/LT_Master.tres", "", ResourceLoader.CACHE_MODE_REUSE)

    if loot_table:
        var items_to_remove = []
        for item in loot_table.items:
            if REMOVED_ITEMS.has(item.file):
                items_to_remove.append(item)
        for item in items_to_remove:
            loot_table.items.erase(item)
        print("[Northcom] Removed " + str(items_to_remove.size()) + " anachronistic items from loot table")

    # Patch armor plate weights
    var plate_ii = ResourceLoader.load("res://Items/Armor/Armor_Plate_II.tres", "", ResourceLoader.CACHE_MODE_REUSE)
    if plate_ii:
        plate_ii.weight = 7.0
        modifiedRes.append(plate_ii)
        print("[Northcom] Patched Armor Plate II weight")
    else:
        push_warning("[Northcom] Failed to load Armor Plate II")

    var plate_iiia = ResourceLoader.load("res://Items/Armor/Armor_Plate_IIIA.tres", "", ResourceLoader.CACHE_MODE_REUSE)
    if plate_iiia:
        plate_iiia.weight = 11.0
        modifiedRes.append(plate_iiia)
        print("[Northcom] Patched Armor Plate IIIA weight")
    else:
        push_warning("[Northcom] Failed to load Armor Plate IIIA")

    # Patch default arm material
    var vanilla_sleeves_mat = ResourceLoader.load("res://Items/Clothing/Jacket_M62/Files/MT_Jacket_M62_Sleeves.tres", "", ResourceLoader.CACHE_MODE_REUSE)
    if vanilla_sleeves_mat:
        var image_al = Image.new()
        if image_al.load("res://Items/Clothing/DefaultArms/Files/TX_Arms_AL.png") == OK:
            var albedo_tex = ImageTexture.create_from_image(image_al)
            vanilla_sleeves_mat.set_shader_parameter("albedo", albedo_tex)
            modifiedRes.append(albedo_tex)
        var image_nr = Image.new()
        if image_nr.load("res://Items/Clothing/DefaultArms/Files/TX_Arms_NR.png") == OK:
            var normal_tex = ImageTexture.create_from_image(image_nr)
            vanilla_sleeves_mat.set_shader_parameter("normal", normal_tex)
            modifiedRes.append(normal_tex)
        modifiedRes.append(vanilla_sleeves_mat)
        print("[Northcom] Default arm material patched OK")
    else:
        push_warning("[Northcom] Failed to patch default arm material")

    # Patch default glove material
    var vanilla_gloves_mat = ResourceLoader.load("res://Items/Clothing/Gloves_Leather/Files/MT_Gloves_Leather.tres", "", ResourceLoader.CACHE_MODE_REUSE)
    var pbr_gloves_mat = ResourceLoader.load("res://Items/Clothing/Gloves_Leather/Files/MT_Gloves_Leather_PBR.tres", "", ResourceLoader.CACHE_MODE_REUSE)
    if vanilla_gloves_mat and pbr_gloves_mat:
        var albedo_tex = ResourceLoader.load("res://Items/Clothing/Gloves_Leather/Files/TX_Gloves_Leather_AL.png", "", ResourceLoader.CACHE_MODE_REUSE)
        if albedo_tex:
            pbr_gloves_mat.set_shader_parameter("albedo", albedo_tex)
            modifiedRes.append(albedo_tex)
        var normal_tex = ResourceLoader.load("res://Items/Clothing/Gloves_Leather/Files/TX_Gloves_Leather_NR.png", "", ResourceLoader.CACHE_MODE_REUSE)
        if normal_tex:
            pbr_gloves_mat.set_shader_parameter("normal", normal_tex)
            modifiedRes.append(normal_tex)
        var image_ao = Image.new()
        if image_ao.load("res://Items/Clothing/Gloves_Leather/Files/TX_Gloves_Leather_AO.png") == OK:
            var ao_tex = ImageTexture.create_from_image(image_ao)
            pbr_gloves_mat.set_shader_parameter("ao_map", ao_tex)
            modifiedRes.append(ao_tex)
        var image_rg = Image.new()
        if image_rg.load("res://Items/Clothing/Gloves_Leather/Files/TX_Gloves_Leather_RG.png") == OK:
            var rg_tex = ImageTexture.create_from_image(image_rg)
            pbr_gloves_mat.set_shader_parameter("roughness_map", rg_tex)
            modifiedRes.append(rg_tex)
        vanilla_gloves_mat.shader = pbr_gloves_mat.shader
        vanilla_gloves_mat.set_shader_parameter("albedo", pbr_gloves_mat.get_shader_parameter("albedo"))
        vanilla_gloves_mat.set_shader_parameter("normal", pbr_gloves_mat.get_shader_parameter("normal"))
        vanilla_gloves_mat.set_shader_parameter("ao_map", pbr_gloves_mat.get_shader_parameter("ao_map"))
        vanilla_gloves_mat.set_shader_parameter("roughness_map", pbr_gloves_mat.get_shader_parameter("roughness_map"))
        vanilla_gloves_mat.set_shader_parameter("useAO", true)
        vanilla_gloves_mat.set_shader_parameter("useRoughness", true)
        modifiedRes.append(pbr_gloves_mat)
        modifiedRes.append(vanilla_gloves_mat)
        print("[Northcom] Default glove material patched OK")
    else:
        push_warning("[Northcom] Failed to patch default glove material")

    for item_def in ITEMS:
        _setup_item(item_def, loot_table)

    for glove_def in GLOVES:
        _setup_glove(glove_def, loot_table)

    # Pre-load and patch the Colt 727 rig material
    var rig_mat = ResourceLoader.load("res://Items/Weapons/Colt_727/Files/MT_Colt_727_Rig.tres", "", ResourceLoader.CACHE_MODE_REUSE)
    if rig_mat:
        var image_al = Image.new()
        if image_al.load("res://Items/Weapons/Colt_727/Files/TX_Colt_727_AL.png") == OK:
            var albedo_tex = ImageTexture.create_from_image(image_al)
            rig_mat.set_shader_parameter("albedo", albedo_tex)
            modifiedRes.append(albedo_tex)
        var image_nr = Image.new()
        if image_nr.load("res://Items/Weapons/Colt_727/Files/TX_Colt_727_NR.png") == OK:
            var normal_tex = ImageTexture.create_from_image(image_nr)
            rig_mat.set_shader_parameter("normal", normal_tex)
            modifiedRes.append(normal_tex)
        colt727_rig_mat = rig_mat
        modifiedRes.append(rig_mat)
        print("[Northcom] Colt 727 rig material patched OK")
    else:
        push_warning("[Northcom] Failed to load Colt 727 rig material")

    if loot_table:
        modifiedRes.append(loot_table)

    get_tree().node_added.connect(_on_node_added)

    print("[Northcom] Setup complete")

func _setup_item(item_def: Dictionary, loot_table) -> void:
    if item_def["body_material"] != "":
        var body_mat = ResourceLoader.load(item_def["body_material"], "", ResourceLoader.CACHE_MODE_REUSE)
        if body_mat:
            var image_body = Image.new()
            if image_body.load(item_def["body_albedo"]) == OK:
                var body_tex = ImageTexture.create_from_image(image_body)
                body_mat.set_shader_parameter("albedo", body_tex)
                modifiedRes.append(body_tex)
            else:
                push_warning("[Northcom] Failed to load body albedo for: " + item_def["file"])

            if item_def.has("normal") and item_def["normal"] != "":
                var image_normal = Image.new()
                if image_normal.load(item_def["normal"]) == OK:
                    var normal_tex = ImageTexture.create_from_image(image_normal)
                    body_mat.set_shader_parameter("normal", normal_tex)
                    modifiedRes.append(normal_tex)
                else:
                    push_warning("[Northcom] Failed to load body normal for: " + item_def["file"])

            modifiedRes.append(body_mat)
        else:
            push_warning("[Northcom] Failed to load body material for: " + item_def["file"])

    if item_def["sleeve_material"] != "":
        var sleeve_mat = ResourceLoader.load(item_def["sleeve_material"], "", ResourceLoader.CACHE_MODE_REUSE)
        if sleeve_mat:
            var image_sleeve = Image.new()
            if image_sleeve.load(item_def["sleeve_albedo"]) == OK:
                var sleeve_tex = ImageTexture.create_from_image(image_sleeve)
                sleeve_mat.set_shader_parameter("albedo", sleeve_tex)
                modifiedRes.append(sleeve_tex)
            else:
                push_warning("[Northcom] Failed to load sleeve albedo for: " + item_def["file"])

            var image_normal = Image.new()
            if image_normal.load(item_def["sleeve_normal"]) == OK:
                var normal_tex = ImageTexture.create_from_image(image_normal)
                sleeve_mat.set_shader_parameter("normal", normal_tex)
                modifiedRes.append(normal_tex)
            else:
                push_warning("[Northcom] Failed to load sleeve normal for: " + item_def["file"])

            if item_def.has("sleeve_ao") and item_def["sleeve_ao"] != "":
                var image_ao = Image.new()
                if image_ao.load(item_def["sleeve_ao"]) == OK:
                    var ao_tex = ImageTexture.create_from_image(image_ao)
                    sleeve_mat.set_shader_parameter("ao_map", ao_tex)
                    modifiedRes.append(ao_tex)
                else:
                    push_warning("[Northcom] Failed to load sleeve AO for: " + item_def["file"])

            if item_def.has("sleeve_roughness") and item_def["sleeve_roughness"] != "":
                var image_rg = Image.new()
                if image_rg.load(item_def["sleeve_roughness"]) == OK:
                    var rg_tex = ImageTexture.create_from_image(image_rg)
                    sleeve_mat.set_shader_parameter("roughness_map", rg_tex)
                    modifiedRes.append(rg_tex)
                else:
                    push_warning("[Northcom] Failed to load sleeve roughness for: " + item_def["file"])

            modifiedRes.append(sleeve_mat)
        else:
            push_warning("[Northcom] Failed to load sleeve material for: " + item_def["file"])

    var image_icon = Image.new()
    if image_icon.load(item_def["icon"]) == OK:
        var icon_tex = ImageTexture.create_from_image(image_icon)
        icon_textures[item_def["file"]] = icon_tex
        modifiedRes.append(icon_tex)
    else:
        push_warning("[Northcom] Failed to load icon for: " + item_def["file"])

    var item_data = ResourceLoader.load(item_def["tres"], "", ResourceLoader.CACHE_MODE_REUSE)
    if item_data:
        if icon_textures.has(item_def["file"]):
            item_data.icon = icon_textures[item_def["file"]]
        if loot_table:
            loot_table.items.append(item_data)
    else:
        push_warning("[Northcom] Failed to load item data for: " + item_def["file"])

func _setup_glove(glove_def: Dictionary, loot_table) -> void:
    var glove_mat = ResourceLoader.load(glove_def["material"], "", ResourceLoader.CACHE_MODE_REUSE)
    if glove_mat:
        var image_al = Image.new()
        if image_al.load(glove_def["albedo"]) == OK:
            var albedo_tex = ImageTexture.create_from_image(image_al)
            glove_mat.set_shader_parameter("albedo", albedo_tex)
            modifiedRes.append(albedo_tex)
        else:
            push_warning("[Northcom] Failed to load glove albedo for: " + glove_def["file"])

        var image_nr = Image.new()
        if image_nr.load(glove_def["normal"]) == OK:
            var normal_tex = ImageTexture.create_from_image(image_nr)
            glove_mat.set_shader_parameter("normal", normal_tex)
            modifiedRes.append(normal_tex)
        else:
            push_warning("[Northcom] Failed to load glove normal for: " + glove_def["file"])

        var image_ao = Image.new()
        if image_ao.load(glove_def["ao"]) == OK:
            var ao_tex = ImageTexture.create_from_image(image_ao)
            glove_mat.set_shader_parameter("ao_map", ao_tex)
            modifiedRes.append(ao_tex)
        else:
            push_warning("[Northcom] Failed to load glove AO for: " + glove_def["file"])

        var image_rg = Image.new()
        if image_rg.load(glove_def["roughness"]) == OK:
            var rg_tex = ImageTexture.create_from_image(image_rg)
            glove_mat.set_shader_parameter("roughness_map", rg_tex)
            modifiedRes.append(rg_tex)
        else:
            push_warning("[Northcom] Failed to load glove roughness for: " + glove_def["file"])

        modifiedRes.append(glove_mat)
        print("[Northcom] Glove material patched OK: " + glove_def["file"])
    else:
        push_warning("[Northcom] Failed to load glove material for: " + glove_def["file"])

    var icon_tex = ResourceLoader.load(glove_def["icon_ctex"], "", ResourceLoader.CACHE_MODE_REUSE)
    if icon_tex:
        icon_textures[glove_def["file"]] = icon_tex
        modifiedRes.append(icon_tex)
    else:
        push_warning("[Northcom] Failed to load glove icon for: " + glove_def["file"])

    var item_data = ResourceLoader.load(glove_def["tres"], "", ResourceLoader.CACHE_MODE_REUSE)
    if item_data:
        if icon_textures.has(glove_def["file"]):
            item_data.icon = icon_textures[glove_def["file"]]
        if loot_table:
            loot_table.items.append(item_data)
    else:
        push_warning("[Northcom] Failed to load glove item data for: " + glove_def["file"])

func _on_node_added(node: Node):
    if node.get_script() != null:
        var script_name = node.get_script().get_global_name()
        if script_name == "Item":
            if not icon_textures.is_empty():
                _patch_item_deferred.call_deferred(node)
        elif script_name == "WeaponRig":
            _patch_rig_deferred.call_deferred(node)

func _patch_item_deferred(node: Node):
    await get_tree().process_frame
    await get_tree().process_frame
    if is_instance_valid(node) and "slotData" in node and node.slotData != null and node.slotData.itemData != null:
        var file = node.slotData.itemData.file
        if icon_textures.has(file):
            for child in node.get_children():
                if child is Sprite2D:
                    child.texture = icon_textures[file]

func _patch_rig_deferred(node: Node):
    await get_tree().process_frame
    await get_tree().process_frame
    if is_instance_valid(node) and "data" in node and node.data != null:
        if node.data.file == "Colt_727" and colt727_rig_mat != null:
            for child in node.get_children():
                if child is Skeleton3D:
                    for mesh_node in child.get_children():
                        if mesh_node is MeshInstance3D:
                            mesh_node.set_surface_override_material(0, colt727_rig_mat)
            print("[Northcom] Patched Colt 727 rig material")