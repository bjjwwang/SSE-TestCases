; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_11-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_11-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_11_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !16, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %call = call i32 (...) @globalReturnsTrue(), !dbg !32
  %tobool = icmp ne i32 %call, 0, !dbg !32
  br i1 %tobool, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [50 x i64], [50 x i64]* %dataBadBuffer, i64 0, i64 0, !dbg !35
  store i64* %arraydecay, i64** %data, align 8, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !39, metadata !DIExpression()), !dbg !41
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !41
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !41
  %1 = load i64*, i64** %data, align 8, !dbg !42
  %2 = bitcast i64* %1 to i8*, !dbg !42
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !42
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !42
  %4 = load i64*, i64** %data, align 8, !dbg !42
  %5 = bitcast i64* %4 to i8*, !dbg !42
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !42
  %call2 = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #5, !dbg !42
  %7 = load i64*, i64** %data, align 8, !dbg !43
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !43
  %8 = load i64, i64* %arrayidx, align 8, !dbg !43
  call void @printLongLongLine(i64 noundef %8), !dbg !44
  ret void, !dbg !45
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @globalReturnsTrue(...) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_11_good() #0 !dbg !46 {
entry:
  call void @goodG2B1(), !dbg !47
  call void @goodG2B2(), !dbg !48
  ret void, !dbg !49
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !50 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !57, metadata !DIExpression()), !dbg !58
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !59, metadata !DIExpression()), !dbg !60
  %call = call i64 @time(i64* noundef null), !dbg !61
  %conv = trunc i64 %call to i32, !dbg !62
  call void @srand(i32 noundef %conv), !dbg !63
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !64
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_11_good(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_11_bad(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

declare void @srand(i32 noundef) #2

declare i64 @time(i64* noundef) #2

declare void @printLine(i8* noundef) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !71 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !72, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !74, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i32 (...) @globalReturnsFalse(), !dbg !78
  %tobool = icmp ne i32 %call, 0, !dbg !78
  br i1 %tobool, label %if.then, label %if.else, !dbg !80

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !81
  br label %if.end, !dbg !83

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !84
  store i64* %arraydecay, i64** %data, align 8, !dbg !86
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !87, metadata !DIExpression()), !dbg !89
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !89
  %1 = load i64*, i64** %data, align 8, !dbg !90
  %2 = bitcast i64* %1 to i8*, !dbg !90
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !90
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !90
  %4 = load i64*, i64** %data, align 8, !dbg !90
  %5 = bitcast i64* %4 to i8*, !dbg !90
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !90
  %call2 = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #5, !dbg !90
  %7 = load i64*, i64** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !91
  %8 = load i64, i64* %arrayidx, align 8, !dbg !91
  call void @printLongLongLine(i64 noundef %8), !dbg !92
  ret void, !dbg !93
}

declare i32 @globalReturnsFalse(...) #2

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !94 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %call = call i32 (...) @globalReturnsTrue(), !dbg !101
  %tobool = icmp ne i32 %call, 0, !dbg !101
  br i1 %tobool, label %if.then, label %if.end, !dbg !103

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !104
  store i64* %arraydecay, i64** %data, align 8, !dbg !106
  br label %if.end, !dbg !107

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !108, metadata !DIExpression()), !dbg !110
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !110
  %1 = load i64*, i64** %data, align 8, !dbg !111
  %2 = bitcast i64* %1 to i8*, !dbg !111
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !111
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !111
  %4 = load i64*, i64** %data, align 8, !dbg !111
  %5 = bitcast i64* %4 to i8*, !dbg !111
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !111
  %call2 = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #5, !dbg !111
  %7 = load i64*, i64** %data, align 8, !dbg !112
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !112
  %8 = load i64, i64* %arrayidx, align 8, !dbg !112
  call void @printLongLongLine(i64 noundef %8), !dbg !113
  ret void, !dbg !114
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_11_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_11-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 23, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !19, line: 30, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!20 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!21 = !DILocation(line: 23, column: 15, scope: !11)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 24, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 24, column: 13, scope: !11)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 25, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 25, column: 13, scope: !11)
!32 = !DILocation(line: 26, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 26, column: 8)
!34 = !DILocation(line: 26, column: 8, scope: !11)
!35 = !DILocation(line: 30, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !12, line: 27, column: 5)
!37 = !DILocation(line: 30, column: 14, scope: !36)
!38 = !DILocation(line: 31, column: 5, scope: !36)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 33, type: !28)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 5)
!41 = !DILocation(line: 33, column: 17, scope: !40)
!42 = !DILocation(line: 35, column: 9, scope: !40)
!43 = !DILocation(line: 36, column: 27, scope: !40)
!44 = !DILocation(line: 36, column: 9, scope: !40)
!45 = !DILocation(line: 38, column: 1, scope: !11)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_11_good", scope: !12, file: !12, line: 87, type: !13, scopeLine: 88, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!47 = !DILocation(line: 89, column: 5, scope: !46)
!48 = !DILocation(line: 90, column: 5, scope: !46)
!49 = !DILocation(line: 91, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 103, type: !51, scopeLine: 104, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !12, line: 103, type: !53)
!58 = !DILocation(line: 103, column: 14, scope: !50)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !12, line: 103, type: !54)
!60 = !DILocation(line: 103, column: 27, scope: !50)
!61 = !DILocation(line: 106, column: 22, scope: !50)
!62 = !DILocation(line: 106, column: 12, scope: !50)
!63 = !DILocation(line: 106, column: 5, scope: !50)
!64 = !DILocation(line: 108, column: 5, scope: !50)
!65 = !DILocation(line: 109, column: 5, scope: !50)
!66 = !DILocation(line: 110, column: 5, scope: !50)
!67 = !DILocation(line: 113, column: 5, scope: !50)
!68 = !DILocation(line: 114, column: 5, scope: !50)
!69 = !DILocation(line: 115, column: 5, scope: !50)
!70 = !DILocation(line: 117, column: 5, scope: !50)
!71 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 45, type: !13, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!72 = !DILocalVariable(name: "data", scope: !71, file: !12, line: 47, type: !17)
!73 = !DILocation(line: 47, column: 15, scope: !71)
!74 = !DILocalVariable(name: "dataBadBuffer", scope: !71, file: !12, line: 48, type: !23)
!75 = !DILocation(line: 48, column: 13, scope: !71)
!76 = !DILocalVariable(name: "dataGoodBuffer", scope: !71, file: !12, line: 49, type: !28)
!77 = !DILocation(line: 49, column: 13, scope: !71)
!78 = !DILocation(line: 50, column: 8, scope: !79)
!79 = distinct !DILexicalBlock(scope: !71, file: !12, line: 50, column: 8)
!80 = !DILocation(line: 50, column: 8, scope: !71)
!81 = !DILocation(line: 53, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !12, line: 51, column: 5)
!83 = !DILocation(line: 54, column: 5, scope: !82)
!84 = !DILocation(line: 58, column: 16, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !12, line: 56, column: 5)
!86 = !DILocation(line: 58, column: 14, scope: !85)
!87 = !DILocalVariable(name: "source", scope: !88, file: !12, line: 61, type: !28)
!88 = distinct !DILexicalBlock(scope: !71, file: !12, line: 60, column: 5)
!89 = !DILocation(line: 61, column: 17, scope: !88)
!90 = !DILocation(line: 63, column: 9, scope: !88)
!91 = !DILocation(line: 64, column: 27, scope: !88)
!92 = !DILocation(line: 64, column: 9, scope: !88)
!93 = !DILocation(line: 66, column: 1, scope: !71)
!94 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!95 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 71, type: !17)
!96 = !DILocation(line: 71, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBadBuffer", scope: !94, file: !12, line: 72, type: !23)
!98 = !DILocation(line: 72, column: 13, scope: !94)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !94, file: !12, line: 73, type: !28)
!100 = !DILocation(line: 73, column: 13, scope: !94)
!101 = !DILocation(line: 74, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !94, file: !12, line: 74, column: 8)
!103 = !DILocation(line: 74, column: 8, scope: !94)
!104 = !DILocation(line: 77, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !12, line: 75, column: 5)
!106 = !DILocation(line: 77, column: 14, scope: !105)
!107 = !DILocation(line: 78, column: 5, scope: !105)
!108 = !DILocalVariable(name: "source", scope: !109, file: !12, line: 80, type: !28)
!109 = distinct !DILexicalBlock(scope: !94, file: !12, line: 79, column: 5)
!110 = !DILocation(line: 80, column: 17, scope: !109)
!111 = !DILocation(line: 82, column: 9, scope: !109)
!112 = !DILocation(line: 83, column: 27, scope: !109)
!113 = !DILocation(line: 83, column: 9, scope: !109)
!114 = !DILocation(line: 85, column: 1, scope: !94)
