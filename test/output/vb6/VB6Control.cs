/** \file */
namespace vb6 {
	class VB6Control
	{
		/**
		 *  \file VB6Control.ctl
		 *  \remarks The original unfiltered source of this file: <A HREF="http://trac.sevo.org/projects/doxyvb/browser/trunk/samples/ClassicVB/VB6Control.ctl">VB6Control.ctl</A>
		 */
		const m_def_BackColor = 0 ; /**< \brief some constant */
		const m_def_ForeColor = 0 ; /**< \brief an other example inline comment */
		const m_def_Enabled = 0;
		const m_def_BackStyle = 0;
		const m_def_BorderStyle = 0;
		private long m_BackColor;
		private long m_ForeColor;
		private bool m_Enabled;
		private Font m_Font;
		private int m_BackStyle;
		private int m_BorderStyle;
		event Click();
		event DblClick();
		event KeyDown(int KeyCode, int Shift);
		event KeyPress(int KeyAscii);
		event KeyUp(int KeyCode, int Shift);
		event MouseDown(int Button, int Shift, float X, float Y);
		event MouseMove(int Button, int Shift, float X, float Y);
		event MouseUp(int Button, int Shift, float X, float Y);
		public long BackColor
		{ get; }
		public long ForeColor
		{ get; set; }
		public bool Enabled
		{ get; set; }
		public Font Font
		{ get; set; }
		public int BackStyle
		{ get; set; }
		public int BorderStyle
		{ get; set; }
		public void Refresh();
		private void UserControl_InitProperties();
		private void UserControl_ReadProperties(PropertyBag PropBag);
		private void UserControl_WriteProperties(PropertyBag PropBag);
	}
	/**
	 * \class VB6Control
	 */
	/**
	 * @class VB6Control
	 *  @brief Custom VB6 User Control
	 *  @remarks this example contains auto generated code by Visual Studio 6.0
	 *           and additional comments as example
	 */
}
