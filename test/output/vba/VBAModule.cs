/** \file */
namespace vba {
	/**
	 *  <summary>VBA Module Example</summary>
	 *  <remarks>The original unfiltered source of this file: <A HREF="http://trac.sevo.org/projects/doxyvb/browser/trunk/samples/ClassicVB/VBAModule.bas">VBAModule.bas</A></remarks>
	 */
	/** \remark Is imported from external library: kernel32.dll */
	public extern  long GetTickCount();
	/** \remark Is imported from external library: kernel32 */
	public extern  long WritePrivateProfileStringA(string strSection, string strKey, string strString, string strFileNameName);
	/**
	 *  Global variable example
	 */
	public double gl_test;
	/**
	 *  <summary>
	 *  simple VBA Public Enum
	 *  </summary>
	 */
	public enum SampleEnum1
	{
		[_First] = 1,
		/**
		 *  First enum item
		 */
		First_Item = 1,
		Second_Item = 2, /**< \brief Second Integer enum Short item Decimal */
		Third_Item = 3, /**< \brief Third Single enum Long item */
		[_Last] = 3
	}
	private enum SampleEnum2 /**< \brief simple VBA Private Enum As Const */
	{
		[_First] = 1,
		First_Item = 1, /**< \brief First enum Double item Delegate Event */
		/**
		 *  Second emum item
		 */
		Second_Item = 2,
		Third_Item = 3,
		/**
		 *  Fourth enum item
		 */
		Fourth_Item = 4,
		[_Last] = 4
	}
	/**
	 *  \brief
	 *    Class used to contain settings of %BPMU instruments based on channels.
	 */
	public struct BPMU_setting
	{
		long channelNumber; /**< \brief Channel number for AddressOf these indexed settings */
		BPMUForceMode bPMUFMode; /**< \brief Set force Function mode (FVMI or FIMV) */
		double clampVoltage; /**< \brief Set clamp voltage */
		double clampCurrent; /**< \brief Set clamp for current */
		double ForceVoltage; /**< \brief Set force voltage */
		double forceCurrent; /**< \brief Set force current */
		BpmuVRange vRange; /**< \brief Set voltage range */
		BpmuIRange iRange; /**< \brief Set current range */
		bool gateOn; /**< \brief Boolean indicating gate setting */
		chtype connectionType; /**< \brief Type of channel type used - how the %BPMU is connected */
	}
	/**
	 *  \brief
	 *    Class used to contain settings of %HDDPS instruments based on channels.
	 */
	public struct HDDPS_Setting
	{
		string PinName; /**< \brief Name of pin associated with this %HDDPS channel */
		long chanNum; /**< \brief Channel number for these indexed settings */
		chtype connectionType; /**< \brief Type of channel used for connection */
		DpsVSource outputSource; /**< \brief Type of output source being used for force (Primary, Alt, or Zero) */
		Variant primaryForceVoltage; /**< \brief Voltage set for primary output source */
		Variant altForceVoltage; /**< \brief Voltage set for alternate output source */
		tlDpsCompliance complianceRange; /**< \brief DPS compliance range setting */
		DpsIRange CurrentRange; /**< \brief Current "I" range setting */
		Variant currentSinkLimit; /**< \brief Set limit for current sink */
		Variant currentSourceLimit; /**< \brief Set limit for current source */
		bool forceRelayClosed; /**< \brief Boolean indicating if force relay is closed */
		bool senseRelayClosed; /**< \brief Boolean indicating if sense relay is closed */
	}
	/**
	 *  <summary>
	 *  simple VBA Type
	 *  </summary>
	 */
	public struct SampleVBAType
	{
		/**
		 *  simple integer value
		 */
		int someInteger; 
		string someString; /**< \brief simple String value Byte dummy Optional Date As Function */
		long someLong; 
		/**
		 *  simple single value
		 */
		float someSingle; 
	}
	/**
	 *  <summary>
	 *  function with parameter Sub
	 *  </summary>
	 *  <param name="pFirst">simple parameter</param>
	 *  <returns>some double value</returns>
	 *  <remarks>Test remark</remarks>
	 */
	public  double SampleModuleFunction(double pFirst, ref Variant t, string s);
	public  long SampleModuleFunction2(ref long pFirst) ; /**< \brief Sample Function comment Char an Object for AddressOf */
	/**
	 *  \cond DEVELOPMENT
	 *  <summary>
	 *  simple method
	 *  </summary>
	 *  <remarks>Test remark</remarks>
	 */
	void SampleModuleMethod();
	/**
	 *  \endcond
	 */
	/**
	 *  \cond DEVELOPMENT
	 */
	void SampleModuleMethod2() ; /**< \brief Sample Sub Event comment Boolean */
	/**
	 *  \endcond
	 */
}
