<CODEGEN_FILENAME><StructureName>MaintVm.dbl</CODEGEN_FILENAME>
<REQUIRES_USERTOKEN>MVVM_DATA_NAMESPACE</REQUIRES_USERTOKEN>
<PROCESS_TEMPLATE>synnet_mvvm_vm_tk</PROCESS_TEMPLATE>
<PROCESS_TEMPLATE>synnet_mvvm_data</PROCESS_TEMPLATE>
<PROCESS_TEMPLATE>synnet_mvvm_relay_command</PROCESS_TEMPLATE>
;//****************************************************************************
;//
;// Title:       mvvm_vm_maint.tpl
;//
;// Type:        CodeGen Template
;//
;// Description: Generates a ViewModel for use in a simple maintenance program
;//
;// Date:        17th February 2011
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
;;*****************************************************************************
;;
;; File:        <StructureName>MaintVm.dbl
;;
;; Description: ViewModel class for structure <STRUCTURE_NOALIAS>
;;
;; Type:        Class
;;
;; Author:      <AUTHOR>, <COMPANY>
;;
;;*****************************************************************************
;;
;; WARNING:     This code was generated by CodeGen. Any changes that you make
;;              to this file will be lost if the code is regenerated.
;;
;;*****************************************************************************

import System
import System.ComponentModel
import System.Windows.Input

namespace <MVVM_DATA_NAMESPACE>

    public class <StructureName>MaintVm extends ToolkitViewModel

        .region "Constructors"

        public method <StructureName>MaintVm
            endparams
        proc
        endmethod

        .endregion

        .region "Public properties"

        private m<StructureName>, @<StructureName>

        public property <StructureName>, @<StructureName>
            method get
            proc
                if (m<StructureName>==^null)
                    m<StructureName> = new <StructureName>()
                mreturn m<StructureName>
            endmethod
            method set
            proc
                m<StructureName> = value
                notifyPropertyChanged("<StructureName>")
            endmethod
        endproperty

        private mVisualStateName, @String

        public property VisualStateName, @string
            method get
            proc
                mreturn mVisualStateName
            endmethod
            method set
            proc
                mVisualStateName = value
                notifyPropertyChanged("VisualStateName")
            endmethod
        endproperty

        .endregion

        .region "OK Command"

        private mCommandOk, @ICommand

        public property CommandOk, @ICommand
            method get
            proc
                if (mCommandOk==^null)
                    mCommandOk = new RelayCommand(CommandOkExecute, CommandOkCanExecute)
                mreturn mCommandOk
            endmethod
        endproperty

        private method CommandOkExecute, void
            parameter, @Object
            endparams
        proc
            this.RaiseMenuEvent("I_OK")
        endmethod

        private method CommandOkCanExecute, Boolean
            parObject, @Object
            endparams
        proc
            mreturn true
        endmethod

        .endregion

        .region "Cancel command"

        private mCancelCommand, @ICommand

        public property CommandCancel, @ICommand
            method get
            proc
                if (mCancelCommand==^null)
                    mCancelCommand = new RelayCommand(CommandCancelExecute, CommandCancelCanExecute)
                mreturn mCancelCommand
            endmethod
        endproperty

        private method CommandCancelExecute, void
            parameter, @Object
            endparams
        proc
            this.RaiseMenuEvent("O_ABANDON")
        endmethod

        private method CommandCancelCanExecute, Boolean
            parObject, @Object
            endparams
        proc
            mreturn true
        endmethod

        .endregion

    endclass

endnamespace
