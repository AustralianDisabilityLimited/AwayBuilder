package awaybuilder.controller.scene 
{
	import away3d.core.base.SubMesh;
	import away3d.materials.ColorMaterial;
	import away3d.materials.MaterialBase;
	import away3d.materials.TextureMaterial;
	import away3d.materials.utils.DefaultMaterialManager;
	import away3d.textures.BitmapTexture;
	import away3d.textures.Texture2DBase;
	
	import awaybuilder.controller.history.HistoryCommandBase;
	import awaybuilder.controller.scene.events.SceneEvent;
	import awaybuilder.model.IDocumentModel;
	import awaybuilder.model.vo.scene.AssetVO;
	import awaybuilder.model.vo.scene.ContainerVO;
	import awaybuilder.model.vo.scene.LightPickerVO;
	import awaybuilder.model.vo.scene.MaterialVO;
	import awaybuilder.model.vo.scene.MeshVO;
	import awaybuilder.model.vo.scene.SubMeshVO;
	import awaybuilder.model.vo.scene.TextureVO;
	import awaybuilder.utils.AssetFactory;
	
	import mx.collections.ArrayCollection;
	
	public class ChangeMaterialCommand extends HistoryCommandBase
	{
	    [Inject]
	    public var event:SceneEvent;
	
	    [Inject]
	    public var document:IDocumentModel;
	
	    override public function execute():void
	    {
	        var newMaterial:MaterialVO = event.newValue as MaterialVO;
	        var vo:MaterialVO = event.items[0] as MaterialVO;
			
//			var prevMaterial:MaterialBase = newMaterial.linkedObject as MaterialBase;
			
			saveOldValue( event, vo.clone() );
			
			vo.name = newMaterial.name;
			vo.alpha = newMaterial.alpha;
			vo.alphaPremultiplied = newMaterial.alphaPremultiplied;
			vo.type = newMaterial.type;
			vo.repeat = newMaterial.repeat;
			vo.isDefault = newMaterial.isDefault;
			vo.bothSides = newMaterial.bothSides;
			vo.extra = newMaterial.extra;
			
			vo.mipmap = newMaterial.mipmap;
			vo.smooth = newMaterial.smooth;
			vo.blendMode = newMaterial.blendMode;
			vo.alphaThreshold = newMaterial.alphaThreshold;
			vo.alphaBlending = newMaterial.alphaBlending;
			vo.colorTransform = newMaterial.colorTransform;
			
			vo.lightPicker = newMaterial.lightPicker;
			vo.light = newMaterial.light;
			vo.shadowMethod = newMaterial.shadowMethod;
			
			vo.normalTexture = newMaterial.normalTexture;
			vo.normalMethodType = newMaterial.normalMethodType;
			
			vo.diffuseTexture = newMaterial.diffuseTexture;
			vo.diffuseColor = newMaterial.diffuseColor;
			vo.diffuseMethodType = newMaterial.diffuseMethodType;
			
			vo.ambientLevel = newMaterial.ambientLevel;
			vo.ambientColor = newMaterial.ambientColor;
			vo.ambientTexture = newMaterial.ambientTexture;
			vo.ambientMethodType = newMaterial.ambientMethodType;
			
			vo.specularLevel = newMaterial.specularLevel;
			vo.specularColor = newMaterial.specularColor;
			vo.specularGloss = newMaterial.specularGloss;
			vo.specularTexture = newMaterial.specularTexture;
			vo.specularMethodType = newMaterial.specularMethodType;
			
			if( newMaterial.effectMethods )
			{
				vo.effectMethods = new ArrayCollection( newMaterial.effectMethods.source );
			}
			
			
			var linkedObjectChanged:Boolean = false;
//			if( newMaterial.type == MaterialVO.TEXTURE && vo.linkedObject is ColorMaterial )
//			{
//				vo.linkedObject = new TextureMaterial( vo.diffuseMethod.texture.linkedObject as Texture2DBase, newMaterial.smooth, newMaterial.repeat, newMaterial.mipmap );
//				linkedObjectChanged = true;
//			}
//			if( newMaterial.type == MaterialVO.COLOR && vo.linkedObject is TextureMaterial )
//			{
//				vo.linkedObject = new ColorMaterial( newMaterial.diffuseMethod.color, 1 );
//				linkedObjectChanged = true;
//			}
			
			
			if( linkedObjectChanged ) // update all meshes that use current material
			{
//				update( prevMaterial, vo );
			}
			
	        addToHistory( event );
	    }
//		private function update( prevMaterial:MaterialBase, newMaterial:MaterialVO ):void 
//		{
//			for each( var asset:AssetVO in AssetFactory.assets )
//			{
//				var mesh:MeshVO = asset as MeshVO;
//				if( mesh )
//				{
//					for each( var subMesh:SubMeshVO in mesh.subMeshes )
//					{
//						if( subMesh.material.equals( prevMaterial ) ) 
//						{
//							subMesh.material = newMaterial.clone();
//						}
//					}
//				}
//			}
//		}
	}
}