// ------------------------------------------------------------------------------
//  <auto-generated>
//      This code was generated by coded UI test builder.
//      Version: 14.0.0.0
//
//      Changes to this file may cause incorrect behavior and will be lost if
//      the code is regenerated.
//  </auto-generated>
// ------------------------------------------------------------------------------

namespace Warewolf.UITests.Scheduler.SchedulerUIMapClasses
{
    using System;
    using System.CodeDom.Compiler;
    using System.Collections.Generic;
    using System.Drawing;
    using System.Text.RegularExpressions;
    using System.Windows.Input;
    using Microsoft.VisualStudio.TestTools.UITest.Extension;
    using Microsoft.VisualStudio.TestTools.UITesting;
    using Microsoft.VisualStudio.TestTools.UITesting.WpfControls;
    using Microsoft.VisualStudio.TestTools.UnitTesting;
    using Keyboard = Microsoft.VisualStudio.TestTools.UITesting.Keyboard;
    using Mouse = Microsoft.VisualStudio.TestTools.UITesting.Mouse;
    using MouseButtons = System.Windows.Forms.MouseButtons;
    
    
    [GeneratedCode("Coded UITest Builder", "14.0.23107.0")]
    public partial class SchedulerUIMap
    {
        
        #region Properties
        public MainStudioWindow MainStudioWindow
        {
            get
            {
                if ((this.mMainStudioWindow == null))
                {
                    this.mMainStudioWindow = new MainStudioWindow();
                }
                return this.mMainStudioWindow;
            }
        }
        #endregion
        
        #region Fields
        private MainStudioWindow mMainStudioWindow;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "14.0.23107.0")]
    public class MainStudioWindow : WpfWindow
    {
        
        public MainStudioWindow()
        {
            #region Search Criteria
            this.SearchProperties.Add(new PropertyExpression(WpfWindow.PropertyNames.Name, "Warewolf", PropertyExpressionOperator.Contains));
            this.SearchProperties.Add(new PropertyExpression(WpfWindow.PropertyNames.ClassName, "HwndWrapper", PropertyExpressionOperator.Contains));
            this.SearchConfigurations.Add(SearchConfiguration.AlwaysSearch);
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public DockManager DockManager
        {
            get
            {
                if ((this.mDockManager == null))
                {
                    this.mDockManager = new DockManager(this);
                }
                return this.mDockManager;
            }
        }
        #endregion
        
        #region Fields
        private DockManager mDockManager;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "14.0.23107.0")]
    public class DockManager : WpfCustom
    {
        
        public DockManager(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfControl.PropertyNames.ClassName] = "Uia.XamDockManager";
            this.SearchProperties[WpfControl.PropertyNames.AutomationId] = "DockManager";
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public SplitPaneMiddle SplitPaneMiddle
        {
            get
            {
                if ((this.mSplitPaneMiddle == null))
                {
                    this.mSplitPaneMiddle = new SplitPaneMiddle(this);
                }
                return this.mSplitPaneMiddle;
            }
        }
        #endregion
        
        #region Fields
        private SplitPaneMiddle mSplitPaneMiddle;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "14.0.23107.0")]
    public class SplitPaneMiddle : WpfCustom
    {
        
        public SplitPaneMiddle(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfControl.PropertyNames.ClassName] = "Uia.SplitPane";
            this.SearchProperties[WpfControl.PropertyNames.Instance] = "2";
            this.SearchConfigurations.Add(SearchConfiguration.NextSibling);
            this.SearchConfigurations.Add(SearchConfiguration.DisambiguateChild);
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public TabManSplitPane TabManSplitPane
        {
            get
            {
                if ((this.mTabManSplitPane == null))
                {
                    this.mTabManSplitPane = new TabManSplitPane(this);
                }
                return this.mTabManSplitPane;
            }
        }
        #endregion
        
        #region Fields
        private TabManSplitPane mTabManSplitPane;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "14.0.23107.0")]
    public class TabManSplitPane : WpfCustom
    {
        
        public TabManSplitPane(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfControl.PropertyNames.ClassName] = "Uia.SplitPane";
            this.SearchProperties[WpfControl.PropertyNames.AutomationId] = "UI_SplitPane_AutoID";
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public TabMan TabMan
        {
            get
            {
                if ((this.mTabMan == null))
                {
                    this.mTabMan = new TabMan(this);
                }
                return this.mTabMan;
            }
        }
        #endregion
        
        #region Fields
        private TabMan mTabMan;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "14.0.23107.0")]
    public class TabMan : WpfTabList
    {
        
        public TabMan(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfTabList.PropertyNames.AutomationId] = "UI_TabManager_AutoID";
            this.WindowTitles.Add("Warewolf");
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public SchedulerTab SchedulerTab
        {
            get
            {
                if ((this.mSchedulerTab == null))
                {
                    this.mSchedulerTab = new SchedulerTab(this);
                }
                return this.mSchedulerTab;
            }
        }
        #endregion
        
        #region Fields
        private SchedulerTab mSchedulerTab;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "14.0.23107.0")]
    public class SchedulerTab : WpfTabPage
    {
        
        public SchedulerTab(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfTabPage.PropertyNames.Name] = "Dev2.Settings.Scheduler.SchedulerViewModel";
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public WorkSurfaceContext WorkSurfaceContext
        {
            get
            {
                if ((this.mWorkSurfaceContext == null))
                {
                    this.mWorkSurfaceContext = new WorkSurfaceContext(this);
                }
                return this.mWorkSurfaceContext;
            }
        }
        
        public WpfButton CloseButton
        {
            get
            {
                if ((this.mCloseButton == null))
                {
                    this.mCloseButton = new WpfButton(this);
                    #region Search Criteria
                    this.mCloseButton.SearchProperties[WpfButton.PropertyNames.AutomationId] = "closeBtn";
                    this.mCloseButton.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mCloseButton;
            }
        }
        #endregion
        
        #region Fields
        private WorkSurfaceContext mWorkSurfaceContext;
        
        private WpfButton mCloseButton;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "14.0.23107.0")]
    public class WorkSurfaceContext : WpfCustom
    {
        
        public WorkSurfaceContext(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfControl.PropertyNames.ClassName] = "Uia.ContentPane";
            this.SearchProperties[WpfControl.PropertyNames.AutomationId] = "Dev2.Studio.ViewModels.WorkSurface.WorkSurfaceContextViewModel";
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public SchedulerView SchedulerView
        {
            get
            {
                if ((this.mSchedulerView == null))
                {
                    this.mSchedulerView = new SchedulerView(this);
                }
                return this.mSchedulerView;
            }
        }
        #endregion
        
        #region Fields
        private SchedulerView mSchedulerView;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "14.0.23107.0")]
    public class SchedulerView : WpfCustom
    {
        
        public SchedulerView(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfControl.PropertyNames.ClassName] = "Uia.SchedulerView";
            this.SearchProperties[WpfControl.PropertyNames.AutomationId] = "UI_SchedulerView_AutoID";
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public WpfCheckBox RunTaskCheckBox
        {
            get
            {
                if ((this.mRunTaskCheckBox == null))
                {
                    this.mRunTaskCheckBox = new WpfCheckBox(this);
                    #region Search Criteria
                    this.mRunTaskCheckBox.SearchProperties[WpfCheckBox.PropertyNames.AutomationId] = "UI_RunAsapCheckBox";
                    this.mRunTaskCheckBox.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mRunTaskCheckBox;
            }
        }
        
        public WpfText RunasthefollowinguseText
        {
            get
            {
                if ((this.mRunasthefollowinguseText == null))
                {
                    this.mRunasthefollowinguseText = new WpfText(this);
                    #region Search Criteria
                    this.mRunasthefollowinguseText.SearchProperties[WpfText.PropertyNames.Name] = "Run as the following user account ";
                    this.mRunasthefollowinguseText.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mRunasthefollowinguseText;
            }
        }
        
        public WpfButton ResourcePickerButton
        {
            get
            {
                if ((this.mResourcePickerButton == null))
                {
                    this.mResourcePickerButton = new WpfButton(this);
                    #region Search Criteria
                    this.mResourcePickerButton.SearchProperties[WpfButton.PropertyNames.AutomationId] = "UI_WorkflowSelectorButton_AutoID";
                    this.mResourcePickerButton.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mResourcePickerButton;
            }
        }
        
        public WpfEdit PasswordTextbox
        {
            get
            {
                if ((this.mPasswordTextbox == null))
                {
                    this.mPasswordTextbox = new WpfEdit(this);
                    #region Search Criteria
                    this.mPasswordTextbox.SearchProperties[WpfEdit.PropertyNames.AutomationId] = "UI_PasswordBox";
                    this.mPasswordTextbox.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mPasswordTextbox;
            }
        }
        
        public WpfEdit NumOfHistoryTextBoxEdit
        {
            get
            {
                if ((this.mNumOfHistoryTextBoxEdit == null))
                {
                    this.mNumOfHistoryTextBoxEdit = new WpfEdit(this);
                    #region Search Criteria
                    this.mNumOfHistoryTextBoxEdit.SearchProperties[WpfEdit.PropertyNames.AutomationId] = "UI_NumOfHisTextBox";
                    this.mNumOfHistoryTextBoxEdit.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mNumOfHistoryTextBoxEdit;
            }
        }
        
        public WpfEdit NameTextbox
        {
            get
            {
                if ((this.mNameTextbox == null))
                {
                    this.mNameTextbox = new WpfEdit(this);
                    #region Search Criteria
                    this.mNameTextbox.SearchProperties[WpfEdit.PropertyNames.AutomationId] = "UI_NameTextbox";
                    this.mNameTextbox.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mNameTextbox;
            }
        }
        
        public WpfTable HistoryTable
        {
            get
            {
                if ((this.mHistoryTable == null))
                {
                    this.mHistoryTable = new WpfTable(this);
                    #region Search Criteria
                    this.mHistoryTable.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mHistoryTable;
            }
        }
        
        public WpfText ErrorMessageText
        {
            get
            {
                if ((this.mErrorMessageText == null))
                {
                    this.mErrorMessageText = new WpfText(this);
                    #region Search Criteria
                    this.mErrorMessageText.SearchProperties[WpfText.PropertyNames.Name] = "Please select a workflow to schedule";
                    this.mErrorMessageText.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mErrorMessageText;
            }
        }
        
        public WpfRadioButton EnabledRadioButton
        {
            get
            {
                if ((this.mEnabledRadioButton == null))
                {
                    this.mEnabledRadioButton = new WpfRadioButton(this);
                    #region Search Criteria
                    this.mEnabledRadioButton.SearchProperties[WpfRadioButton.PropertyNames.AutomationId] = "UI_EnabledRadioButton";
                    this.mEnabledRadioButton.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mEnabledRadioButton;
            }
        }
        
        public WpfButton EditTriggerButton
        {
            get
            {
                if ((this.mEditTriggerButton == null))
                {
                    this.mEditTriggerButton = new WpfButton(this);
                    #region Search Criteria
                    this.mEditTriggerButton.SearchProperties[WpfButton.PropertyNames.AutomationId] = "UI_EditTriggerButton_AutoID";
                    this.mEditTriggerButton.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mEditTriggerButton;
            }
        }
        
        public SchedulesList SchedulesList
        {
            get
            {
                if ((this.mSchedulesList == null))
                {
                    this.mSchedulesList = new SchedulesList(this);
                }
                return this.mSchedulesList;
            }
        }
        
        public WpfEdit UserNameTextBoxEdit
        {
            get
            {
                if ((this.mUserNameTextBoxEdit == null))
                {
                    this.mUserNameTextBoxEdit = new WpfEdit(this);
                    #region Search Criteria
                    this.mUserNameTextBoxEdit.SearchProperties[WpfEdit.PropertyNames.AutomationId] = "UI_UserNameTextBox";
                    this.mUserNameTextBoxEdit.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mUserNameTextBoxEdit;
            }
        }
        
        public WpfEdit WorkflowNameTextBox
        {
            get
            {
                if ((this.mWorkflowNameTextBox == null))
                {
                    this.mWorkflowNameTextBox = new WpfEdit(this);
                    #region Search Criteria
                    this.mWorkflowNameTextBox.SearchProperties[WpfEdit.PropertyNames.AutomationId] = "UI_WorkflowNameTextBox_AutoID";
                    this.mWorkflowNameTextBox.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mWorkflowNameTextBox;
            }
        }
        
        public WpfRadioButton DisabledRadioButton
        {
            get
            {
                if ((this.mDisabledRadioButton == null))
                {
                    this.mDisabledRadioButton = new WpfRadioButton(this);
                    #region Search Criteria
                    this.mDisabledRadioButton.SearchProperties[WpfRadioButton.PropertyNames.AutomationId] = "UI_DisabledRadioButton";
                    this.mDisabledRadioButton.WindowTitles.Add("Warewolf");
                    #endregion
                }
                return this.mDisabledRadioButton;
            }
        }
        #endregion
        
        #region Fields
        private WpfCheckBox mRunTaskCheckBox;
        
        private WpfText mRunasthefollowinguseText;
        
        private WpfButton mResourcePickerButton;
        
        private WpfEdit mPasswordTextbox;
        
        private WpfEdit mNumOfHistoryTextBoxEdit;
        
        private WpfEdit mNameTextbox;
        
        private WpfTable mHistoryTable;
        
        private WpfText mErrorMessageText;
        
        private WpfRadioButton mEnabledRadioButton;
        
        private WpfButton mEditTriggerButton;
        
        private SchedulesList mSchedulesList;
        
        private WpfEdit mUserNameTextBoxEdit;
        
        private WpfEdit mWorkflowNameTextBox;
        
        private WpfRadioButton mDisabledRadioButton;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "14.0.23107.0")]
    public class SchedulesList : WpfList
    {
        
        public SchedulesList(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfList.PropertyNames.AutomationId] = "Schedules";
            this.WindowTitles.Add("Warewolf");
            #endregion
        }
        
        #region Properties
        public ScheduleNewTaskListItem ScheduleNewTaskListItem
        {
            get
            {
                if ((this.mScheduleNewTaskListItem == null))
                {
                    this.mScheduleNewTaskListItem = new ScheduleNewTaskListItem(this);
                }
                return this.mScheduleNewTaskListItem;
            }
        }
        
        public HelloWorldListItem HelloWorldListItem
        {
            get
            {
                if ((this.mHelloWorldListItem == null))
                {
                    this.mHelloWorldListItem = new HelloWorldListItem(this);
                }
                return this.mHelloWorldListItem;
            }
        }
        
        public GenericResourceListItem GenericResourceListItem
        {
            get
            {
                if ((this.mGenericResourceListItem == null))
                {
                    this.mGenericResourceListItem = new GenericResourceListItem(this);
                }
                return this.mGenericResourceListItem;
            }
        }
        #endregion
        
        #region Fields
        private ScheduleNewTaskListItem mScheduleNewTaskListItem;
        
        private HelloWorldListItem mHelloWorldListItem;
        
        private GenericResourceListItem mGenericResourceListItem;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "14.0.23107.0")]
    public class ScheduleNewTaskListItem : WpfListItem
    {
        
        public ScheduleNewTaskListItem(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfListItem.PropertyNames.Name] = "Dev2.Scheduler.DummyResource";
            this.WindowTitles.Add("Warewolf (DEV2\\DYLAN.DELPORT)");
            #endregion
        }
        
        #region Properties
        public WpfButton SchedulerNewTaskButton
        {
            get
            {
                if ((this.mSchedulerNewTaskButton == null))
                {
                    this.mSchedulerNewTaskButton = new WpfButton(this);
                    #region Search Criteria
                    this.mSchedulerNewTaskButton.SearchProperties[WpfButton.PropertyNames.AutomationId] = "UI_NewSchedule_AutoID";
                    this.mSchedulerNewTaskButton.WindowTitles.Add("Warewolf (DEV2\\DYLAN.DELPORT)");
                    #endregion
                }
                return this.mSchedulerNewTaskButton;
            }
        }
        #endregion
        
        #region Fields
        private WpfButton mSchedulerNewTaskButton;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "14.0.23107.0")]
    public class HelloWorldListItem : WpfListItem
    {
        
        public HelloWorldListItem(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfListItem.PropertyNames.Name] = "Name:Hello World ResourceId:acb75027-ddeb-47d7-814e-a54c37247ec1";
            this.WindowTitles.Add("Warewolf (DEV2\\DYLAN.DELPORT)");
            #endregion
        }
        
        #region Properties
        public WpfCheckBox EnableOrDisableCheckBox
        {
            get
            {
                if ((this.mEnableOrDisableCheckBox == null))
                {
                    this.mEnableOrDisableCheckBox = new WpfCheckBox(this);
                    #region Search Criteria
                    this.mEnableOrDisableCheckBox.SearchProperties[WpfCheckBox.PropertyNames.HelpText] = "Enable or Disable the schedule";
                    this.mEnableOrDisableCheckBox.WindowTitles.Add("Warewolf (DEV2\\DYLAN.DELPORT)");
                    #endregion
                }
                return this.mEnableOrDisableCheckBox;
            }
        }
        
        public WpfButton EraseScheduleButton
        {
            get
            {
                if ((this.mEraseScheduleButton == null))
                {
                    this.mEraseScheduleButton = new WpfButton(this);
                    #region Search Criteria
                    this.mEraseScheduleButton.SearchProperties[WpfButton.PropertyNames.HelpText] = "Delete this scheduled task";
                    this.mEraseScheduleButton.WindowTitles.Add("Warewolf (DEV2\\DYLAN.DELPORT)");
                    #endregion
                }
                return this.mEraseScheduleButton;
            }
        }
        #endregion
        
        #region Fields
        private WpfCheckBox mEnableOrDisableCheckBox;
        
        private WpfButton mEraseScheduleButton;
        #endregion
    }
    
    [GeneratedCode("Coded UITest Builder", "14.0.23107.0")]
    public class GenericResourceListItem : WpfListItem
    {
        
        public GenericResourceListItem(UITestControl searchLimitContainer) : 
                base(searchLimitContainer)
        {
            #region Search Criteria
            this.SearchProperties[WpfListItem.PropertyNames.Name] = "Name:GenericResource ResourceId:cb1e9256-95e8-4479-a223-10555b904bce";
            this.WindowTitles.Add("Warewolf (DEV2\\DYLAN.DELPORT)");
            #endregion
        }
        
        #region Properties
        public WpfCheckBox EnableOrDisableCheckBox
        {
            get
            {
                if ((this.mEnableOrDisableCheckBox == null))
                {
                    this.mEnableOrDisableCheckBox = new WpfCheckBox(this);
                    #region Search Criteria
                    this.mEnableOrDisableCheckBox.SearchProperties[WpfCheckBox.PropertyNames.HelpText] = "Enable or Disable the schedule";
                    this.mEnableOrDisableCheckBox.WindowTitles.Add("Warewolf (DEV2\\DYLAN.DELPORT)");
                    #endregion
                }
                return this.mEnableOrDisableCheckBox;
            }
        }
        
        public WpfButton EraseScheduleButton
        {
            get
            {
                if ((this.mEraseScheduleButton == null))
                {
                    this.mEraseScheduleButton = new WpfButton(this);
                    #region Search Criteria
                    this.mEraseScheduleButton.SearchProperties[WpfButton.PropertyNames.HelpText] = "Delete this scheduled task";
                    this.mEraseScheduleButton.WindowTitles.Add("Warewolf (DEV2\\DYLAN.DELPORT)");
                    #endregion
                }
                return this.mEraseScheduleButton;
            }
        }
        #endregion
        
        #region Fields
        private WpfCheckBox mEnableOrDisableCheckBox;
        
        private WpfButton mEraseScheduleButton;
        #endregion
    }
}
