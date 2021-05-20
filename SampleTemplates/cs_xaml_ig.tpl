<CODEGEN_FILENAME>frm<WindowName>.xaml</CODEGEN_FILENAME>
<PROCESS_TEMPLATE>cs_xaml_ig_codebehind.tpl</PROCESS_TEMPLATE>
;//****************************************************************************
;//
;// Title:       cs_xaml_ig.tpl
;//
;// Type:        CodeGen Template
;//
;// Description: Template to generate a C# WPF Windows From representing a
;//              Synergy repository structure using Infragistics WPF controls
;//
;// Date:        12th November 2009
;//
;// Author:      Steve Ives, Synergex Professional Services Group
;//              http://www.synergex.com
;//
;//****************************************************************************
;//
;// Copyright (c) 2012, Synergex International, Inc.
;// All rights reserved.
;//
;// Redistribution and use in source and binary forms, with or without
;// modification, are permitted provided that the following conditions are met:
;//
;// * Redistributions of source code must retain the above copyright notice,
;//   this list of conditions and the following disclaimer.
;//
;// * Redistributions in binary form must reproduce the above copyright notice,
;//   this list of conditions and the following disclaimer in the documentation
;//   and/or other materials provided with the distribution.
;//
;// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
;// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;// POSSIBILITY OF SUCH DAMAGE.
;//
<!--
//*****************************************************************************
//
// File:        frm<WindowName>.xaml
//
// Description: WPF form for structure <structure_name>
//
// Type:        WPF Window
//
// Author:      <AUTHOR>
//
//*****************************************************************************
//
// WARNING:     This code was generated by CodeGen. Any changes that you make
//              to this file will be lost if the code is regenerated.
//
//*****************************************************************************
-->
<Window x:Class="<NAMESPACE>.frm<WindowName>"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="<STRUCTURE_DESC> Maintenance" Height="<WINDOW_HEIGHTPX>" Width="<WINDOW_WIDTHPX>"
    WindowStyle="SingleBorderWindow" ResizeMode="NoResize" ShowInTaskbar="False" WindowStartupLocation="CenterOwner"
    Loaded="frm<WindowName>_Loaded">
    <Grid>
<FIELD_LOOP>
;//----------------------------------------------------------------------------
;//TextBox fields
  <IF TEXTBOX>
    <IF PROMPT>
        <Label Name="lbl<Field_sqlname>" Height="23"  Width="120" Margin="<PROMPT_PIXEL_COL>,<PROMPT_PIXEL_ROW>,0,0" HorizontalAlignment="Left" VerticalAlignment="Top"><FIELD_PROMPT></Label>
    </IF>
    <IF ALPHA>
;//Not sure how to do uppercase?
        <igEditors:XamTextEditor Name="txt<Field_sqlname>" Height="23.96" Width="<FIELD_PIXEL_WIDTH>" Margin="<FIELD_PIXEL_COL>,<FIELD_PIXEL_ROW>,0,0" TabIndex="<FIELD#LOGICAL>" HorizontalAlignment="Left" VerticalAlignment="Top"<IF DISABLED> IsEnabled="False"</IF><IF READONLY> IsReadOnly="True"</IF><IF INFOLINE> ToolTip="<FIELD_INFOLINE>"</IF><IF DEFAULT> Text="<FIELD_DEFAULT>"</IF> xmlns:igEditors="http://infragistics.com/Editors" />
    <ELSE DECIMAL>
        <igEditors:XamNumericEditor Name="txt<Field_sqlname>" Height="23.96" Width="<FIELD_PIXEL_WIDTH>" Margin="<FIELD_PIXEL_COL>,<FIELD_PIXEL_ROW>,0,0" TabIndex="<FIELD#LOGICAL>" HorizontalAlignment="Left" VerticalAlignment="Top"<IF DISABLED> IsEnabled="False"</IF><IF READONLY> IsReadOnly="True"</IF><IF INFOLINE> ToolTip="<FIELD_INFOLINE>"</IF><IF DEFAULT> Text="<FIELD_DEFAULT>"</IF> xmlns:igEditors="http://infragistics.com/Editors" />
    <ELSE DATE>
        <igEditors:XamDateTimeEditor Name="txt<Field_sqlname>" Height="23.96" Width="<FIELD_PIXEL_WIDTH>" Margin="<FIELD_PIXEL_COL>,<FIELD_PIXEL_ROW>,0,0" TabIndex="<FIELD#LOGICAL>" HorizontalAlignment="Left" VerticalAlignment="Top"<IF DISABLED> IsEnabled="False"</IF><IF READONLY> IsReadOnly="True"</IF><IF INFOLINE> ToolTip="<FIELD_INFOLINE>"</IF><IF DEFAULT> Text="<FIELD_DEFAULT>"</IF> xmlns:igEditors="http://infragistics.com/Editors" />
    <ELSE TIME>
        <igEditors:XamDateTimeEditor Name="txt<Field_sqlname>" Height="23.96" Width="<FIELD_PIXEL_WIDTH>" Margin="<FIELD_PIXEL_COL>,<FIELD_PIXEL_ROW>,0,0" TabIndex="<FIELD#LOGICAL>" HorizontalAlignment="Left" VerticalAlignment="Top"<IF DISABLED> IsEnabled="False"</IF><IF READONLY> IsReadOnly="True"</IF><IF INFOLINE> ToolTip="<FIELD_INFOLINE>"</IF><IF DEFAULT> Text="<FIELD_DEFAULT>"</IF> xmlns:igEditors="http://infragistics.com/Editors" />
    </IF>
;//----------------------------------------------------------------------------
;//CheckBox fields
  <ELSE CHECKBOX>
        <igRibbon:CheckBoxTool Name="chk<Field_sqlname>" Height="23" Width="<PROMPT_PIXEL_WIDTH>" Margin="<FIELD_PIXEL_COL>,<FIELD_PIXEL_ROW>,0,0" TabIndex="<FIELD#LOGICAL>" HorizontalAlignment="Left" VerticalAlignment="Top"<IF DISABLED> IsEnabled="False"</IF><IF INFOLINE> ToolTip="<FIELD_INFOLINE>"</IF> xmlns:igRibbon="http://infragistics.com/Ribbon"><FIELD_PROMPT></igRibbon:CheckBoxTool>
;//----------------------------------------------------------------------------
;//ComboBox Fields
  <ELSE COMBOBOX>
    <IF PROMPT>
        <Label Name="lbl<Field_sqlname>" Height="23"  Width="120" Margin="<PROMPT_PIXEL_COL>,<PROMPT_PIXEL_ROW>,0,0" HorizontalAlignment="Left" VerticalAlignment="Top"><FIELD_PROMPT></Label>
    </IF>
        <igEditors:XamComboEditor Name="cbo<Field_sqlname>" Height="23.96" Width="<FIELD_PIXEL_WIDTH>" Margin="<FIELD_PIXEL_COL>,<FIELD_PIXEL_ROW>,0,0" SelectedIndex="0" TabIndex="<FIELD#LOGICAL>" HorizontalAlignment="Left" VerticalAlignment="Top"<IF DISABLED> IsEnabled="False"</IF><IF READONLY> IsReadOnly="True"</IF><IF INFOLINE> ToolTip="<FIELD_INFOLINE>"</IF> xmlns:igEditors="http://infragistics.com/Editors">
            <igEditors:XamComboEditor.ItemsProvider>
                <igEditors:ComboBoxItemsProvider>
    <SELECTION_LOOP>
                    <igEditors:ComboBoxDataItem DisplayText="<SELECTION_TEXT>" Value="<SELECTION_VALUE>"/>
    </SELECTION_LOOP>
                </igEditors:ComboBoxItemsProvider>
            </igEditors:XamComboEditor.ItemsProvider>
        </igEditors:XamComboEditor>
;//----------------------------------------------------------------------------
;//RadioButton Fields
  <ELSE RADIOBUTTONS>
    <IF PROMPT>
        <Label Name="lbl<Field_sqlname>" Height="23"  Width="120" Margin="<PROMPT_PIXEL_COL>,<PROMPT_PIXEL_ROW>,0,0" HorizontalAlignment="Left" VerticalAlignment="Top"><FIELD_PROMPT></Label>
    </IF>
        <StackPanel Margin="<FIELD_PIXEL_COL>,<FIELD_PIXEL_ROW>,0,0" Width="<FIELD_PIXEL_WIDTH>" HorizontalAlignment="Left" VerticalAlignment="Top"<IF DISABLED> IsEnabled="False"</IF>>
    <SELECTION_LOOP>
            <RadioButton Name="rb<Field_sqlname><SELECTION_NUMBER>" Tag="<SELECTION_VALUE>" Height="16" HorizontalAlignment="Left" VerticalAlignment="Bottom"<IF INFOLINE> ToolTip="<FIELD_INFOLINE>"</IF><IF FIRST> IsChecked="true"</IF>><SELECTION_TEXT></RadioButton>
    </SELECTION_LOOP>
        </StackPanel>
  </IF>
</FIELD_LOOP>
        <Button Name="btnOK" Height="23" Width="75" Margin="0,0,100,10"  HorizontalAlignment="Right" VerticalAlignment="Bottom" Click="btnOK_Click">OK</Button>
        <Button Name="btnCancel" Height="23" Width="75" Margin="0,0,10,10" HorizontalAlignment="Right" VerticalAlignment="Bottom" Click="btnCancel_Click">Cancel</Button>
    </Grid>
</Window>
