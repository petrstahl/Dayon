package mpo.dayon.assisted;

import mpo.dayon.assisted.gui.Assisted;
import mpo.dayon.common.babylon.Zion;
import mpo.dayon.common.error.FatalErrorHandler;
import mpo.dayon.common.log.Log;
import mpo.dayon.common.utils.SystemUtilities;

public class AssistedRunner {
	public static void main(String[] args) {
		try {
			SystemUtilities.setApplicationName("dayon_assisted");
			
			Zion.overrideLocale(args);

			Log.info("============================================================================================");
			for (String line : SystemUtilities.getSystemProperties()) {
				Log.info(line);
			}
			Log.info("============================================================================================");

			final Assisted assisted = new Assisted();

			assisted.configure();
			assisted.start();
		} catch (Exception ex) {
			FatalErrorHandler.bye("The assisted is dead!", ex);
		}
	}

}
