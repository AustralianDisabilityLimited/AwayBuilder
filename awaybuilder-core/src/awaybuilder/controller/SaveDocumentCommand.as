package awaybuilder.controller
{
	import awaybuilder.controller.events.SaveDocumentEvent;
	import awaybuilder.model.IDocumentModel;
	import awaybuilder.services.IDocumentService;
	
	import org.robotlegs.mvcs.Command;

	public class SaveDocumentCommand extends Command
	{
		[Inject]
		public var event:SaveDocumentEvent;
		
		[Inject]
		public var document:IDocumentModel;
		
		[Inject]
		public var documentService:IDocumentService;
		
		override public function execute():void
		{
//			var xmlData:XML = writeXML(this.document.objects, this.documentNamespace);
//			writeSettingsXML(xmlData, this.document, this.documentNamespace);
			if(this.event.type == SaveDocumentEvent.SAVE_DOCUMENT_AS ||
				!this.document.path)
			{
				this.documentService.saveAs(document.scenegraph, this.document.name);
			}
			else
			{
				this.documentService.save(document.scenegraph, this.document.path);
			}
		}
	}
}