; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45_badData = internal global i64* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45_goodG2BData = internal global i64* null, align 8, !dbg !7

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45_bad() #0 !dbg !21 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !32, metadata !DIExpression()), !dbg !36
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !37
  store i64* %arraydecay, i64** %data, align 8, !dbg !38
  %0 = load i64*, i64** %data, align 8, !dbg !39
  store i64* %0, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45_badData, align 8, !dbg !40
  call void @badSink(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45_good() #0 !dbg !43 {
entry:
  call void @goodG2B(), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !46 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* noundef null), !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 noundef %conv), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45_good(), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45_bad(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @badSink() #0 !dbg !67 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = load i64*, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45_badData, align 8, !dbg !70
  store i64* %0, i64** %data, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !71, metadata !DIExpression()), !dbg !73
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !73
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !73
  %2 = load i64*, i64** %data, align 8, !dbg !74
  %3 = bitcast i64* %2 to i8*, !dbg !74
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !74
  %4 = bitcast i64* %arraydecay to i8*, !dbg !74
  %5 = load i64*, i64** %data, align 8, !dbg !74
  %6 = bitcast i64* %5 to i8*, !dbg !74
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !74
  %call = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 800, i64 noundef %7) #5, !dbg !74
  %8 = load i64*, i64** %data, align 8, !dbg !75
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !75
  %9 = load i64, i64* %arrayidx, align 8, !dbg !75
  call void @printLongLongLine(i64 noundef %9), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !78 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !79, metadata !DIExpression()), !dbg !80
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !81, metadata !DIExpression()), !dbg !82
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !83, metadata !DIExpression()), !dbg !84
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !85
  store i64* %arraydecay, i64** %data, align 8, !dbg !86
  %0 = load i64*, i64** %data, align 8, !dbg !87
  store i64* %0, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45_goodG2BData, align 8, !dbg !88
  call void @goodG2BSink(), !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2BSink() #0 !dbg !91 {
entry:
  %data = alloca i64*, align 8
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !92, metadata !DIExpression()), !dbg !93
  %0 = load i64*, i64** @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45_goodG2BData, align 8, !dbg !94
  store i64* %0, i64** %data, align 8, !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !95, metadata !DIExpression()), !dbg !97
  %1 = bitcast [100 x i64]* %source to i8*, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 800, i1 false), !dbg !97
  %2 = load i64*, i64** %data, align 8, !dbg !98
  %3 = bitcast i64* %2 to i8*, !dbg !98
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !98
  %4 = bitcast i64* %arraydecay to i8*, !dbg !98
  %5 = load i64*, i64** %data, align 8, !dbg !98
  %6 = bitcast i64* %5 to i8*, !dbg !98
  %7 = call i64 @llvm.objectsize.i64.p0i8(i8* %6, i1 false, i1 true, i1 false), !dbg !98
  %call = call i8* @__memmove_chk(i8* noundef %3, i8* noundef %4, i64 noundef 800, i64 noundef %7) #5, !dbg !98
  %8 = load i64*, i64** %data, align 8, !dbg !99
  %arrayidx = getelementptr inbounds i64, i64* %8, i64 0, !dbg !99
  %9 = load i64, i64* %arrayidx, align 8, !dbg !99
  call void @printLongLongLine(i64 noundef %9), !dbg !100
  ret void, !dbg !101
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45_badData", scope: !2, file: !9, line: 19, type: !10, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !6, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5}
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!0, !7}
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45_goodG2BData", scope: !2, file: !9, line: 20, type: !10, isLocal: true, isDefinition: true)
!9 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !12, line: 30, baseType: !13)
!12 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!13 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 4}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"PIC Level", i32 2}
!18 = !{i32 7, !"uwtable", i32 1}
!19 = !{i32 7, !"frame-pointer", i32 2}
!20 = !{!"Homebrew clang version 14.0.6"}
!21 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45_bad", scope: !9, file: !9, line: 35, type: !22, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !{}
!25 = !DILocalVariable(name: "data", scope: !21, file: !9, line: 37, type: !10)
!26 = !DILocation(line: 37, column: 15, scope: !21)
!27 = !DILocalVariable(name: "dataBadBuffer", scope: !21, file: !9, line: 38, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 3200, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 50)
!31 = !DILocation(line: 38, column: 13, scope: !21)
!32 = !DILocalVariable(name: "dataGoodBuffer", scope: !21, file: !9, line: 39, type: !33)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 6400, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 100)
!36 = !DILocation(line: 39, column: 13, scope: !21)
!37 = !DILocation(line: 42, column: 12, scope: !21)
!38 = !DILocation(line: 42, column: 10, scope: !21)
!39 = !DILocation(line: 43, column: 85, scope: !21)
!40 = !DILocation(line: 43, column: 83, scope: !21)
!41 = !DILocation(line: 44, column: 5, scope: !21)
!42 = !DILocation(line: 45, column: 1, scope: !21)
!43 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_45_good", scope: !9, file: !9, line: 74, type: !22, scopeLine: 75, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!44 = !DILocation(line: 76, column: 5, scope: !43)
!45 = !DILocation(line: 77, column: 1, scope: !43)
!46 = distinct !DISubprogram(name: "main", scope: !9, file: !9, line: 88, type: !47, scopeLine: 89, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !24)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !9, line: 88, type: !49)
!54 = !DILocation(line: 88, column: 14, scope: !46)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !9, line: 88, type: !50)
!56 = !DILocation(line: 88, column: 27, scope: !46)
!57 = !DILocation(line: 91, column: 22, scope: !46)
!58 = !DILocation(line: 91, column: 12, scope: !46)
!59 = !DILocation(line: 91, column: 5, scope: !46)
!60 = !DILocation(line: 93, column: 5, scope: !46)
!61 = !DILocation(line: 94, column: 5, scope: !46)
!62 = !DILocation(line: 95, column: 5, scope: !46)
!63 = !DILocation(line: 98, column: 5, scope: !46)
!64 = !DILocation(line: 99, column: 5, scope: !46)
!65 = !DILocation(line: 100, column: 5, scope: !46)
!66 = !DILocation(line: 102, column: 5, scope: !46)
!67 = distinct !DISubprogram(name: "badSink", scope: !9, file: !9, line: 24, type: !22, scopeLine: 25, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!68 = !DILocalVariable(name: "data", scope: !67, file: !9, line: 26, type: !10)
!69 = !DILocation(line: 26, column: 15, scope: !67)
!70 = !DILocation(line: 26, column: 22, scope: !67)
!71 = !DILocalVariable(name: "source", scope: !72, file: !9, line: 28, type: !33)
!72 = distinct !DILexicalBlock(scope: !67, file: !9, line: 27, column: 5)
!73 = !DILocation(line: 28, column: 17, scope: !72)
!74 = !DILocation(line: 30, column: 9, scope: !72)
!75 = !DILocation(line: 31, column: 27, scope: !72)
!76 = !DILocation(line: 31, column: 9, scope: !72)
!77 = !DILocation(line: 33, column: 1, scope: !67)
!78 = distinct !DISubprogram(name: "goodG2B", scope: !9, file: !9, line: 63, type: !22, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!79 = !DILocalVariable(name: "data", scope: !78, file: !9, line: 65, type: !10)
!80 = !DILocation(line: 65, column: 15, scope: !78)
!81 = !DILocalVariable(name: "dataBadBuffer", scope: !78, file: !9, line: 66, type: !28)
!82 = !DILocation(line: 66, column: 13, scope: !78)
!83 = !DILocalVariable(name: "dataGoodBuffer", scope: !78, file: !9, line: 67, type: !33)
!84 = !DILocation(line: 67, column: 13, scope: !78)
!85 = !DILocation(line: 69, column: 12, scope: !78)
!86 = !DILocation(line: 69, column: 10, scope: !78)
!87 = !DILocation(line: 70, column: 89, scope: !78)
!88 = !DILocation(line: 70, column: 87, scope: !78)
!89 = !DILocation(line: 71, column: 5, scope: !78)
!90 = !DILocation(line: 72, column: 1, scope: !78)
!91 = distinct !DISubprogram(name: "goodG2BSink", scope: !9, file: !9, line: 52, type: !22, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !24)
!92 = !DILocalVariable(name: "data", scope: !91, file: !9, line: 54, type: !10)
!93 = !DILocation(line: 54, column: 15, scope: !91)
!94 = !DILocation(line: 54, column: 22, scope: !91)
!95 = !DILocalVariable(name: "source", scope: !96, file: !9, line: 56, type: !33)
!96 = distinct !DILexicalBlock(scope: !91, file: !9, line: 55, column: 5)
!97 = !DILocation(line: 56, column: 17, scope: !96)
!98 = !DILocation(line: 58, column: 9, scope: !96)
!99 = !DILocation(line: 59, column: 27, scope: !96)
!100 = !DILocation(line: 59, column: 9, scope: !96)
!101 = !DILocation(line: 61, column: 1, scope: !91)
