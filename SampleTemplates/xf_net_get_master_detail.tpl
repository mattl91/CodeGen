<CODEGEN_FILENAME>Get<StructureName>.dbl</CODEGEN_FILENAME>
<REQUIRES_USERTOKEN>XF_INTERFACE</REQUIRES_USERTOKEN>
<REQUIRES_USERTOKEN>XF_ELB</REQUIRES_USERTOKEN>
;//****************************************************************************
;//
;// Title:       xf_net_get_master_detail.tpl
;//
;// Type:        CodeGen Template
;//
;// Description: This template generates a Synergy method suitable for use
;//              with xfServerPlus and xfNetLink .NET. The method retrieves a
;//              master record from one file, and a collection of detail
;//              records from another ISAM file. This template requires that
;//              two structures be processed at the same time using the -ms
;//              command line option. An example use case for this template
;//              would be generating a method to retrieve an order header
;//              record and a collection of related order detail records.
;//
;// Date:        5th June 2012
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
;; File:        Get<StructureName>.dbl
;;
;; Description: Reads and returns an <StructureName> record along with a
<STRUCTURE#2>
;;              related collection of <StructureName> records
<STRUCTURE#1>
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
<STRUCTURE#2>
.ifndef str<StructureName>
.include "<STRUCTURE_NOALIAS>" repository, structure="str<StructureName>", end
.endc
<STRUCTURE#1>

;;;<summary>
;;; Retrieves an <StructureName>
;;;</summary>
<PRIMARY_KEY>
  <SEGMENT_LOOP>
;;;<param name="<SegmentName>">Primary key of <StructureName></param>
  </SEGMENT_LOOP>
</PRIMARY_KEY>
;;;<param name="<StructureName>">Returned <StructureName> record</param>
<STRUCTURE#2>
;;;<param name="<StructureName>s">Returned <StructureName>s collection</param>
<STRUCTURE#1>
;;;<returns>True for success, false for failure</returns>
{xfMethod(interface="<XF_INTERFACE>",elb="<XF_ELB>")}
function Get<StructureName>, Boolean

<PRIMARY_KEY>
  <SEGMENT_LOOP>
    {xfParameter(name="<SegmentName>")}
    required in  a<SegmentName>, <segment_spec>
  </SEGMENT_LOOP>
</PRIMARY_KEY>
    
    {xfParameter(name="<StructureName>")}
    required out a<StructureName>, str<StructureName>
    
<STRUCTURE#2>
    {xfParameter(name="<StructureName>s",collectionType=xfCollectType.structure,structure="str<StructureName>")}
    required out a<StructureName>s, @ArrayList
<STRUCTURE#1>
    
    endparams

    stack record localData
        ok, Boolean
        ch<StructureName>, int
<STRUCTURE#2>
        ch<StructureName>, int
        <structure_name>, str<StructureName>
<STRUCTURE#1>
        mainKey, a^size(str<StructureName>)
    endrecord

proc
    ok = true
    init a<StructureName>
<STRUCTURE#2>
    a<StructureName>s = new ArrayList()
<STRUCTURE#1>

    ;;Open the data files
    try
    begin
        open(ch<StructureName>=0,i:i,"<FILE_NAME>")
<STRUCTURE#2>
        open(ch<StructureName>=0,i:i,"<FILE_NAME>")
<STRUCTURE#1>
    end
    catch (ex)
    begin
        ok = false
    end
    endtry

    ;;Load the <StructureName> record
    if (ok)
    begin
<PRIMARY_KEY>
  <SEGMENT_LOOP>
        a<StructureName>.<segment_name> = a<SegmentName>
  </SEGMENT_LOOP>
</PRIMARY_KEY>
        try
        begin
            mainKey = %keyval(ch<StructureName>,a<StructureName>,0)
            read(ch<StructureName>,a<StructureName>,atrim(mainKey))
        end
        catch (ex)
        begin
            ok = false
        end
        endtry
    end

<STRUCTURE#2>
    ;;Position to <StructureName> record
    if (ok)
    begin
        try
        begin
            find(ch<StructureName>,,atrim(mainKey))
        end
        catch (ex)
        begin
            clear ok
        end
        endtry
    end

    ;;Load the <StructureName> recoords
    if (ok)
    begin
        repeat
        begin
            try
            begin
                reads(ch<StructureName>,<structure_name>)
                if (keyval(ch<StructureName>,<structure_name>,0)!=atrim(mainKey))
                    exitloop
                a<StructureName>s.Add((@str<StructureName>)<structure_name>)
            end
            catch (ex, @EndOfFileException)
            begin
                exitloop
            end
            catch (ex, @KeyNotSameException)
            begin
                exitloop
            end
            catch (ex)
            begin
                ok = false
            end
            endtry
        end
    end
<STRUCTURE#1>

    ;;Close the data file channels
    if (ch<StructureName>&&chopen(ch<StructureName>))
        close ch<StructureName>
<STRUCTURE#2>
    if (ch<StructureName>&&chopen(ch<StructureName>))
        close ch<StructureName>
<STRUCTURE#1>

    ;;If we had an error make sure we don't return any data
    if (!ok)
    begin
        init a<StructureName>
<STRUCTURE#2>
        clear a<StructureName>s
<STRUCTURE#1>
    end

    freturn ok

endfunction
