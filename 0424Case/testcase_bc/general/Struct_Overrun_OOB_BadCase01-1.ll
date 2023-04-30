; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/general/Struct_Overrun_OOB_BadCase01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/general/Struct_Overrun_OOB_BadCase01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct.PPUB_SCTP_PACKET_HEADER_ST = type { i32 }
%struct.PPUB_SCTP_IPV4HDR_S = type { i64, i64, i8 }

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @test17_c() #0 !dbg !26 {
entry:
  %len = alloca i32, align 4
  %ulIpHeaderOffset = alloca i32, align 4
  %pucPacket = alloca [256 x i8], align 16
  %pstSctpHeader = alloca %struct.PPUB_SCTP_PACKET_HEADER_ST*, align 8
  %pstIpV4Header = alloca %struct.PPUB_SCTP_IPV4HDR_S*, align 8
  %ulFromAddrs = alloca i64, align 8
  %ulToAddrs = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %len, metadata !30, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata i32* %ulIpHeaderOffset, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata [256 x i8]* %pucPacket, metadata !35, metadata !DIExpression()), !dbg !39
  %0 = bitcast [256 x i8]* %pucPacket to i8*, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 256, i1 false), !dbg !39
  call void @llvm.dbg.declare(metadata %struct.PPUB_SCTP_PACKET_HEADER_ST** %pstSctpHeader, metadata !40, metadata !DIExpression()), !dbg !41
  store %struct.PPUB_SCTP_PACKET_HEADER_ST* null, %struct.PPUB_SCTP_PACKET_HEADER_ST** %pstSctpHeader, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata %struct.PPUB_SCTP_IPV4HDR_S** %pstIpV4Header, metadata !42, metadata !DIExpression()), !dbg !43
  store %struct.PPUB_SCTP_IPV4HDR_S* null, %struct.PPUB_SCTP_IPV4HDR_S** %pstIpV4Header, align 8, !dbg !43
  call void @llvm.dbg.declare(metadata i64* %ulFromAddrs, metadata !44, metadata !DIExpression()), !dbg !45
  store i64 0, i64* %ulFromAddrs, align 8, !dbg !45
  call void @llvm.dbg.declare(metadata i64* %ulToAddrs, metadata !46, metadata !DIExpression()), !dbg !47
  store i64 0, i64* %ulToAddrs, align 8, !dbg !47
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %pucPacket, i64 0, i64 0, !dbg !48
  %call = call i32 @recv(i32 noundef 0, i8* noundef %arraydecay, i32 noundef 256, i32 noundef 0), !dbg !49
  store i32 %call, i32* %len, align 4, !dbg !50
  %1 = load i32, i32* %len, align 4, !dbg !51
  %cmp = icmp sle i32 %1, 0, !dbg !53
  br i1 %cmp, label %if.then, label %if.else, !dbg !54

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !55

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [256 x i8], [256 x i8]* %pucPacket, i64 0, i64 0, !dbg !57
  %2 = bitcast i8* %arraydecay1 to %struct.PPUB_SCTP_IPV4HDR_S*, !dbg !59
  store %struct.PPUB_SCTP_IPV4HDR_S* %2, %struct.PPUB_SCTP_IPV4HDR_S** %pstIpV4Header, align 8, !dbg !60
  %3 = load %struct.PPUB_SCTP_IPV4HDR_S*, %struct.PPUB_SCTP_IPV4HDR_S** %pstIpV4Header, align 8, !dbg !61
  %ucHeaderLength = getelementptr inbounds %struct.PPUB_SCTP_IPV4HDR_S, %struct.PPUB_SCTP_IPV4HDR_S* %3, i32 0, i32 2, !dbg !62
  %4 = load i8, i8* %ucHeaderLength, align 8, !dbg !62
  %conv = zext i8 %4 to i64, !dbg !61
  %mul = mul i64 4, %conv, !dbg !63
  %conv2 = trunc i64 %mul to i32, !dbg !64
  store i32 %conv2, i32* %ulIpHeaderOffset, align 4, !dbg !65
  %5 = load %struct.PPUB_SCTP_IPV4HDR_S*, %struct.PPUB_SCTP_IPV4HDR_S** %pstIpV4Header, align 8, !dbg !66
  %ulSrcAddr = getelementptr inbounds %struct.PPUB_SCTP_IPV4HDR_S, %struct.PPUB_SCTP_IPV4HDR_S* %5, i32 0, i32 0, !dbg !67
  %6 = load i64, i64* %ulSrcAddr, align 8, !dbg !67
  store i64 %6, i64* %ulFromAddrs, align 8, !dbg !68
  %7 = load %struct.PPUB_SCTP_IPV4HDR_S*, %struct.PPUB_SCTP_IPV4HDR_S** %pstIpV4Header, align 8, !dbg !69
  %ulDstAddr = getelementptr inbounds %struct.PPUB_SCTP_IPV4HDR_S, %struct.PPUB_SCTP_IPV4HDR_S* %7, i32 0, i32 1, !dbg !70
  %8 = load i64, i64* %ulDstAddr, align 8, !dbg !70
  store i64 %8, i64* %ulToAddrs, align 8, !dbg !71
  %arraydecay3 = getelementptr inbounds [256 x i8], [256 x i8]* %pucPacket, i64 0, i64 0, !dbg !72
  %9 = load i32, i32* %ulIpHeaderOffset, align 4, !dbg !73
  %idx.ext = zext i32 %9 to i64, !dbg !74
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay3, i64 %idx.ext, !dbg !74
  %10 = bitcast i8* %add.ptr to %struct.PPUB_SCTP_PACKET_HEADER_ST*, !dbg !75
  store %struct.PPUB_SCTP_PACKET_HEADER_ST* %10, %struct.PPUB_SCTP_PACKET_HEADER_ST** %pstSctpHeader, align 8, !dbg !76
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare i32 @recv(i32 noundef, i8* noundef, i32 noundef, i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  call void @test17_c(), !dbg !88
  ret i32 0, !dbg !89
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!19, !20, !21, !22, !23, !24}
!llvm.ident = !{!25}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/general/Struct_Overrun_OOB_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{!3, !13}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "PPUB_SCTP_IPV4HDR_S", file: !5, line: 15, baseType: !6)
!5 = !DIFile(filename: "general/Struct_Overrun_OOB_BadCase01-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !5, line: 10, size: 192, elements: !7)
!7 = !{!8, !10, !11}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "ulSrcAddr", scope: !6, file: !5, line: 12, baseType: !9, size: 64)
!9 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "ulDstAddr", scope: !6, file: !5, line: 13, baseType: !9, size: 64, offset: 64)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "ucHeaderLength", scope: !6, file: !5, line: 14, baseType: !12, size: 8, offset: 128)
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 64)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "PPUB_SCTP_PACKET_HEADER_ST", file: !5, line: 19, baseType: !15)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !5, line: 16, size: 32, elements: !16)
!16 = !{!17}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "i", scope: !15, file: !5, line: 18, baseType: !18, size: 32)
!18 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"PIC Level", i32 2}
!23 = !{i32 7, !"uwtable", i32 1}
!24 = !{i32 7, !"frame-pointer", i32 2}
!25 = !{!"Homebrew clang version 14.0.6"}
!26 = distinct !DISubprogram(name: "test17_c", scope: !5, file: !5, line: 26, type: !27, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !29)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !{}
!30 = !DILocalVariable(name: "len", scope: !26, file: !5, line: 28, type: !31)
!31 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!32 = !DILocation(line: 28, column: 9, scope: !26)
!33 = !DILocalVariable(name: "ulIpHeaderOffset", scope: !26, file: !5, line: 29, type: !18)
!34 = !DILocation(line: 29, column: 18, scope: !26)
!35 = !DILocalVariable(name: "pucPacket", scope: !26, file: !5, line: 30, type: !36)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 2048, elements: !37)
!37 = !{!38}
!38 = !DISubrange(count: 256)
!39 = !DILocation(line: 30, column: 19, scope: !26)
!40 = !DILocalVariable(name: "pstSctpHeader", scope: !26, file: !5, line: 31, type: !13)
!41 = !DILocation(line: 31, column: 33, scope: !26)
!42 = !DILocalVariable(name: "pstIpV4Header", scope: !26, file: !5, line: 32, type: !3)
!43 = !DILocation(line: 32, column: 26, scope: !26)
!44 = !DILocalVariable(name: "ulFromAddrs", scope: !26, file: !5, line: 33, type: !9)
!45 = !DILocation(line: 33, column: 19, scope: !26)
!46 = !DILocalVariable(name: "ulToAddrs", scope: !26, file: !5, line: 34, type: !9)
!47 = !DILocation(line: 34, column: 19, scope: !26)
!48 = !DILocation(line: 36, column: 19, scope: !26)
!49 = !DILocation(line: 36, column: 11, scope: !26)
!50 = !DILocation(line: 36, column: 9, scope: !26)
!51 = !DILocation(line: 37, column: 9, scope: !52)
!52 = distinct !DILexicalBlock(scope: !26, file: !5, line: 37, column: 9)
!53 = !DILocation(line: 37, column: 13, scope: !52)
!54 = !DILocation(line: 37, column: 9, scope: !26)
!55 = !DILocation(line: 38, column: 9, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !5, line: 37, column: 19)
!57 = !DILocation(line: 40, column: 46, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !5, line: 39, column: 12)
!59 = !DILocation(line: 40, column: 23, scope: !58)
!60 = !DILocation(line: 40, column: 21, scope: !58)
!61 = !DILocation(line: 43, column: 49, scope: !58)
!62 = !DILocation(line: 43, column: 64, scope: !58)
!63 = !DILocation(line: 43, column: 47, scope: !58)
!64 = !DILocation(line: 43, column: 26, scope: !58)
!65 = !DILocation(line: 43, column: 24, scope: !58)
!66 = !DILocation(line: 46, column: 21, scope: !58)
!67 = !DILocation(line: 46, column: 36, scope: !58)
!68 = !DILocation(line: 46, column: 19, scope: !58)
!69 = !DILocation(line: 49, column: 19, scope: !58)
!70 = !DILocation(line: 49, column: 34, scope: !58)
!71 = !DILocation(line: 49, column: 17, scope: !58)
!72 = !DILocation(line: 52, column: 53, scope: !58)
!73 = !DILocation(line: 52, column: 65, scope: !58)
!74 = !DILocation(line: 52, column: 63, scope: !58)
!75 = !DILocation(line: 52, column: 23, scope: !58)
!76 = !DILocation(line: 52, column: 21, scope: !58)
!77 = !DILocation(line: 56, column: 1, scope: !26)
!78 = distinct !DISubprogram(name: "main", scope: !5, file: !5, line: 60, type: !79, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !29)
!79 = !DISubroutineType(types: !80)
!80 = !{!31, !31, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !5, line: 60, type: !31)
!85 = !DILocation(line: 60, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !5, line: 60, type: !81)
!87 = !DILocation(line: 60, column: 27, scope: !78)
!88 = !DILocation(line: 62, column: 5, scope: !78)
!89 = !DILocation(line: 63, column: 2, scope: !78)
