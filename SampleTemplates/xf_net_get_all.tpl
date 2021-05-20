<CODEGEN_FILENAME>GetAll<StructureName>s.dbl</CODEGEN_FILENAME>
<REQUIRES_USERTOKEN>XF_INTERFACE</REQUIRES_USERTOKEN>
<REQUIRES_USERTOKEN>XF_ELB</REQUIRES_USERTOKEN>
;//****************************************************************************
;//
;// Title:       xf_net_get_all.tpl
;//
;// Type:        CodeGen Template
;//
;// Description: This template generates a Synergy method suitable for use
;//              with xfServerPlus and xfNetLink .NET. The method retrieves a
;//              collection of records from an ISAM file.
;//
;// Date:        17th October 2008
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
;; File:        GetAll<StructureName>s.dbl
;;
;; Description: Returns a collection of <STRUCTURE_NAME> records
;;
;; Type:        Synergy/DE xfServerPlus Method
;;
;; Author:      <AUTHOR>
;;
;; Company:     <COMPANY>
;;
;;*****************************************************************************
;;
;; WARNING:     This code was generated by CodeGen. Any changes that you make
;;              to this file will be lost if the code is regenerated.
;;
;;*****************************************************************************
;;
import System.Collections

.ifndef str<StructureName>
.include "<STRUCTURE_NOALIAS>" repository, structure="str<StructureName>", end
.endc

{xfMethod(interface="<XF_INTERFACE>",elb="<XF_ELB>")}
function GetAll<StructureName>s, boolean

<PRIMARY_KEY>
  <SEGMENT_LOOP_FILTER>
    {xfParameter(name="<SegmentName>")}
    required in  a<SegmentName>, <segment_spec>

  </SEGMENT_LOOP_FILTER>
</PRIMARY_KEY>
    {xfParameter(name="<StructureName>s",collectionType=xfCollectType.structure,structure="str<StructureName>",dataTable=true)}
    required out a<StructureName>s, @ArrayList

    endparams

    stack record local_data
        retVal  ,boolean
        ch<StructureName>, int
        <structure_name>, str<StructureName>
<PRIMARY_KEY>
  <IF MULTIPLE_SEGMENTS>
        filterData, a<KEY_LENGTH>
        filterLen, int
  </IF>
</PRIMARY_KEY>
    endrecord

proc

    init local_data
    retVal=true

    a<StructureName>s = new ArrayList()

<PRIMARY_KEY>
  <IF MULTIPLE_SEGMENTS>
    <SEGMENT_LOOP_FILTER>
    <structure_name>.<segment_name> = a<SegmentName>
    filterLen += ^size(<structure_name>.<segment_name>)
    </SEGMENT_LOOP_FILTER>
    filterData=keyval(ch<StructureName>,<structure_name>,0)
  </IF>
</PRIMARY_KEY>

    try
    begin
        ;;Open the data file
        open(ch<StructureName>=syn_freechn(),i:i,"<FILE_NAME>")

        ;;Position to the first record to be returned
<PRIMARY_KEY>
  <IF SINGLE_SEGMENT>
        find(ch<StructureName>,,^FIRST)
  <ELSE MULTIPLE_SEGMENTS>
        find(ch<StructureName>,,filterData(1:filterLen))
  </IF>
</PRIMARY_KEY>

        ;;Read and return the data
        repeat
        begin
            ;;Get the next record
            reads(ch<StructureName>,<structure_name>)
<PRIMARY_KEY>
  <IF MULTIPLE_SEGMENTS>

            ;;Make sure we're still in range with the filter
            if (keyval(ch<StructureName>,<structure_name>,0)!=filterData(1:filterLen))
                exitloop
  </IF>
</PRIMARY_KEY>

            ;;Add the record to the return collection
            a<StructureName>s.Add((@str<StructureName>)<structure_name>)
        end
    end
    catch (ex, @EndOfFileException)
        nop
    catch (ex, @KeyNotSameException)
        nop
    catch (ex)
        retval=false
    finally
    begin
        if (ch<StructureName>&&chopen(ch<StructureName>))
            close ch<StructureName>
    end
    endtry

    freturn retVal

endfunction
