; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_41-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_41-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_41_badSink(i64* noundef %data) #0 !dbg !11 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !22, metadata !DIExpression()), !dbg !27
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !27
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !27
  %1 = load i64*, i64** %data.addr, align 8, !dbg !28
  %2 = bitcast i64* %1 to i8*, !dbg !28
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !28
  %3 = bitcast i64* %arraydecay to i8*, !dbg !28
  %4 = load i64*, i64** %data.addr, align 8, !dbg !28
  %5 = bitcast i64* %4 to i8*, !dbg !28
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !28
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #5, !dbg !28
  %7 = load i64*, i64** %data.addr, align 8, !dbg !29
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !29
  %8 = load i64, i64* %arrayidx, align 8, !dbg !29
  call void @printLongLongLine(i64 noundef %8), !dbg !30
  ret void, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_41_bad() #0 !dbg !32 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !35, metadata !DIExpression()), !dbg !36
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !37, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !42, metadata !DIExpression()), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !44
  store i64* %arraydecay, i64** %data, align 8, !dbg !45
  %0 = load i64*, i64** %data, align 8, !dbg !46
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_41_badSink(i64* noundef %0), !dbg !47
  ret void, !dbg !48
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_41_goodG2BSink(i64* noundef %data) #0 !dbg !49 {
entry:
  %data.addr = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  store i64* %data, i64** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i64** %data.addr, metadata !50, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !52, metadata !DIExpression()), !dbg !54
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !54
  %1 = load i64*, i64** %data.addr, align 8, !dbg !55
  %2 = bitcast i64* %1 to i8*, !dbg !55
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !55
  %3 = bitcast i64* %arraydecay to i8*, !dbg !55
  %4 = load i64*, i64** %data.addr, align 8, !dbg !55
  %5 = bitcast i64* %4 to i8*, !dbg !55
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !55
  %call = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #5, !dbg !55
  %7 = load i64*, i64** %data.addr, align 8, !dbg !56
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !56
  %8 = load i64, i64* %arrayidx, align 8, !dbg !56
  call void @printLongLongLine(i64 noundef %8), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_41_good() #0 !dbg !59 {
entry:
  call void @goodG2B(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* noundef null), !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 noundef %conv), !dbg !75
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !76
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_41_good(), !dbg !77
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !79
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_41_bad(), !dbg !80
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !83 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !84, metadata !DIExpression()), !dbg !85
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !90
  store i64* %arraydecay, i64** %data, align 8, !dbg !91
  %0 = load i64*, i64** %data, align 8, !dbg !92
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_41_goodG2BSink(i64* noundef %0), !dbg !93
  ret void, !dbg !94
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_41_badSink", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_41-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !17, line: 30, baseType: !18)
!17 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!18 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!19 = !{}
!20 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 21, type: !15)
!21 = !DILocation(line: 21, column: 94, scope: !11)
!22 = !DILocalVariable(name: "source", scope: !23, file: !12, line: 24, type: !24)
!23 = distinct !DILexicalBlock(scope: !11, file: !12, line: 23, column: 5)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 6400, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 100)
!27 = !DILocation(line: 24, column: 17, scope: !23)
!28 = !DILocation(line: 26, column: 9, scope: !23)
!29 = !DILocation(line: 27, column: 27, scope: !23)
!30 = !DILocation(line: 27, column: 9, scope: !23)
!31 = !DILocation(line: 29, column: 1, scope: !11)
!32 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_41_bad", scope: !12, file: !12, line: 31, type: !33, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !DILocalVariable(name: "data", scope: !32, file: !12, line: 33, type: !15)
!36 = !DILocation(line: 33, column: 15, scope: !32)
!37 = !DILocalVariable(name: "dataBadBuffer", scope: !32, file: !12, line: 34, type: !38)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 3200, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 50)
!41 = !DILocation(line: 34, column: 13, scope: !32)
!42 = !DILocalVariable(name: "dataGoodBuffer", scope: !32, file: !12, line: 35, type: !24)
!43 = !DILocation(line: 35, column: 13, scope: !32)
!44 = !DILocation(line: 38, column: 12, scope: !32)
!45 = !DILocation(line: 38, column: 10, scope: !32)
!46 = !DILocation(line: 39, column: 83, scope: !32)
!47 = !DILocation(line: 39, column: 5, scope: !32)
!48 = !DILocation(line: 40, column: 1, scope: !32)
!49 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_41_goodG2BSink", scope: !12, file: !12, line: 46, type: !13, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!50 = !DILocalVariable(name: "data", arg: 1, scope: !49, file: !12, line: 46, type: !15)
!51 = !DILocation(line: 46, column: 98, scope: !49)
!52 = !DILocalVariable(name: "source", scope: !53, file: !12, line: 49, type: !24)
!53 = distinct !DILexicalBlock(scope: !49, file: !12, line: 48, column: 5)
!54 = !DILocation(line: 49, column: 17, scope: !53)
!55 = !DILocation(line: 51, column: 9, scope: !53)
!56 = !DILocation(line: 52, column: 27, scope: !53)
!57 = !DILocation(line: 52, column: 9, scope: !53)
!58 = !DILocation(line: 54, column: 1, scope: !49)
!59 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_41_good", scope: !12, file: !12, line: 67, type: !33, scopeLine: 68, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!60 = !DILocation(line: 69, column: 5, scope: !59)
!61 = !DILocation(line: 70, column: 1, scope: !59)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 82, type: !63, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !19)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 82, type: !65)
!70 = !DILocation(line: 82, column: 14, scope: !62)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 82, type: !66)
!72 = !DILocation(line: 82, column: 27, scope: !62)
!73 = !DILocation(line: 85, column: 22, scope: !62)
!74 = !DILocation(line: 85, column: 12, scope: !62)
!75 = !DILocation(line: 85, column: 5, scope: !62)
!76 = !DILocation(line: 87, column: 5, scope: !62)
!77 = !DILocation(line: 88, column: 5, scope: !62)
!78 = !DILocation(line: 89, column: 5, scope: !62)
!79 = !DILocation(line: 92, column: 5, scope: !62)
!80 = !DILocation(line: 93, column: 5, scope: !62)
!81 = !DILocation(line: 94, column: 5, scope: !62)
!82 = !DILocation(line: 96, column: 5, scope: !62)
!83 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 57, type: !33, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !19)
!84 = !DILocalVariable(name: "data", scope: !83, file: !12, line: 59, type: !15)
!85 = !DILocation(line: 59, column: 15, scope: !83)
!86 = !DILocalVariable(name: "dataBadBuffer", scope: !83, file: !12, line: 60, type: !38)
!87 = !DILocation(line: 60, column: 13, scope: !83)
!88 = !DILocalVariable(name: "dataGoodBuffer", scope: !83, file: !12, line: 61, type: !24)
!89 = !DILocation(line: 61, column: 13, scope: !83)
!90 = !DILocation(line: 63, column: 12, scope: !83)
!91 = !DILocation(line: 63, column: 10, scope: !83)
!92 = !DILocation(line: 64, column: 87, scope: !83)
!93 = !DILocation(line: 64, column: 5, scope: !83)
!94 = !DILocation(line: 65, column: 1, scope: !83)
