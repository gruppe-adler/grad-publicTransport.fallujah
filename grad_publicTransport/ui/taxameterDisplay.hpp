class GRAD_publicTransport_taxameter
	{
		idd = -1;
		duration = 9999999;
		name = "GRAD_publicTransport_taxameter";
		fadeIn = 3;

		class controlsBackground {
			class GRAD_publicTransport_taxameter_bg : RscStructuredText 
			{
				idc = -1;
				text = "<t size='1.5' shadow='0' align='center'>Taxameter</t>";
				color[] = {1,1,1,0.3};
				x = safeZoneX + safeZoneW - 0.3;
				y = safeZoneY + safeZoneH - 1.5;
				w = 0.3;
				h = 0.8;
				colorBackground[] = {0,0,0,0.7};
			};
		};

	 	class controls {
			

			class GRAD_publicTransport_taxameter_text : RscStructuredText 
			{
				idc = -1;
				text = "<t size='1.5' shadow='0' align='center'></t>";
				color[] = {1,1,1,0.8};
				x = safeZoneX + safeZoneW - 0.3;
				y = safeZoneY + safeZoneH - 1.3;
				w = 0.3;
				h = 0.6;
				onLoad = "uiNamespace setVariable ['GRAD_publicTransport_taxameter_text', (_this select 0)];";
			};
		};
	};