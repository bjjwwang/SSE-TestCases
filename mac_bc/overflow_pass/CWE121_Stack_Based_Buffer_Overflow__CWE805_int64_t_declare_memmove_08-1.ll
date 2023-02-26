; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !16, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %call = call i32 @staticReturnsTrue(), !dbg !32
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

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLongLongLine(i64 noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08_good() #0 !dbg !46 {
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
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08_good(), !dbg !65
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !67
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08_bad(), !dbg !68
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !69
  ret i32 0, !dbg !70
}

declare void @srand(i32 noundef) #4

declare i64 @time(i64* noundef) #4

declare void @printLine(i8* noundef) #4

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !71 {
entry:
  ret i32 1, !dbg !74
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !76, metadata !DIExpression()), !dbg !77
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !78, metadata !DIExpression()), !dbg !79
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i32 @staticReturnsFalse(), !dbg !82
  %tobool = icmp ne i32 %call, 0, !dbg !82
  br i1 %tobool, label %if.then, label %if.else, !dbg !84

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !85
  br label %if.end, !dbg !87

if.else:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !88
  store i64* %arraydecay, i64** %data, align 8, !dbg !90
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !91, metadata !DIExpression()), !dbg !93
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !93
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !93
  %1 = load i64*, i64** %data, align 8, !dbg !94
  %2 = bitcast i64* %1 to i8*, !dbg !94
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !94
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !94
  %4 = load i64*, i64** %data, align 8, !dbg !94
  %5 = bitcast i64* %4 to i8*, !dbg !94
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !94
  %call2 = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #5, !dbg !94
  %7 = load i64*, i64** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !95
  %8 = load i64, i64* %arrayidx, align 8, !dbg !95
  call void @printLongLongLine(i64 noundef %8), !dbg !96
  ret void, !dbg !97
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !98 {
entry:
  ret i32 0, !dbg !99
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !100 {
entry:
  %data = alloca i64*, align 8
  %dataBadBuffer = alloca [50 x i64], align 16
  %dataGoodBuffer = alloca [100 x i64], align 16
  %source = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !101, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.declare(metadata [50 x i64]* %dataBadBuffer, metadata !103, metadata !DIExpression()), !dbg !104
  call void @llvm.dbg.declare(metadata [100 x i64]* %dataGoodBuffer, metadata !105, metadata !DIExpression()), !dbg !106
  %call = call i32 @staticReturnsTrue(), !dbg !107
  %tobool = icmp ne i32 %call, 0, !dbg !107
  br i1 %tobool, label %if.then, label %if.end, !dbg !109

if.then:                                          ; preds = %entry
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %dataGoodBuffer, i64 0, i64 0, !dbg !110
  store i64* %arraydecay, i64** %data, align 8, !dbg !112
  br label %if.end, !dbg !113

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i64]* %source, metadata !114, metadata !DIExpression()), !dbg !116
  %0 = bitcast [100 x i64]* %source to i8*, !dbg !116
  call void @llvm.memset.p0i8.i64(i8* align 16 %0, i8 0, i64 800, i1 false), !dbg !116
  %1 = load i64*, i64** %data, align 8, !dbg !117
  %2 = bitcast i64* %1 to i8*, !dbg !117
  %arraydecay1 = getelementptr inbounds [100 x i64], [100 x i64]* %source, i64 0, i64 0, !dbg !117
  %3 = bitcast i64* %arraydecay1 to i8*, !dbg !117
  %4 = load i64*, i64** %data, align 8, !dbg !117
  %5 = bitcast i64* %4 to i8*, !dbg !117
  %6 = call i64 @llvm.objectsize.i64.p0i8(i8* %5, i1 false, i1 true, i1 false), !dbg !117
  %call2 = call i8* @__memmove_chk(i8* noundef %2, i8* noundef %3, i64 noundef 800, i64 noundef %6) #5, !dbg !117
  %7 = load i64*, i64** %data, align 8, !dbg !118
  %arrayidx = getelementptr inbounds i64, i64* %7, i64 0, !dbg !118
  %8 = load i64, i64* %arrayidx, align 8, !dbg !118
  call void @printLongLongLine(i64 noundef %8), !dbg !119
  ret void, !dbg !120
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08_bad", scope: !12, file: !12, line: 35, type: !13, scopeLine: 36, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 37, type: !17)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !19, line: 30, baseType: !20)
!19 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_int64_t.h", directory: "")
!20 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!21 = !DILocation(line: 37, column: 15, scope: !11)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 38, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 3200, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 38, column: 13, scope: !11)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 39, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 6400, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 39, column: 13, scope: !11)
!32 = !DILocation(line: 40, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !11, file: !12, line: 40, column: 8)
!34 = !DILocation(line: 40, column: 8, scope: !11)
!35 = !DILocation(line: 44, column: 16, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !12, line: 41, column: 5)
!37 = !DILocation(line: 44, column: 14, scope: !36)
!38 = !DILocation(line: 45, column: 5, scope: !36)
!39 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 47, type: !28)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 5)
!41 = !DILocation(line: 47, column: 17, scope: !40)
!42 = !DILocation(line: 49, column: 9, scope: !40)
!43 = !DILocation(line: 50, column: 27, scope: !40)
!44 = !DILocation(line: 50, column: 9, scope: !40)
!45 = !DILocation(line: 52, column: 1, scope: !11)
!46 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_int64_t_declare_memmove_08_good", scope: !12, file: !12, line: 101, type: !13, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!47 = !DILocation(line: 103, column: 5, scope: !46)
!48 = !DILocation(line: 104, column: 5, scope: !46)
!49 = !DILocation(line: 105, column: 1, scope: !46)
!50 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 117, type: !51, scopeLine: 118, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocalVariable(name: "argc", arg: 1, scope: !50, file: !12, line: 117, type: !53)
!58 = !DILocation(line: 117, column: 14, scope: !50)
!59 = !DILocalVariable(name: "argv", arg: 2, scope: !50, file: !12, line: 117, type: !54)
!60 = !DILocation(line: 117, column: 27, scope: !50)
!61 = !DILocation(line: 120, column: 22, scope: !50)
!62 = !DILocation(line: 120, column: 12, scope: !50)
!63 = !DILocation(line: 120, column: 5, scope: !50)
!64 = !DILocation(line: 122, column: 5, scope: !50)
!65 = !DILocation(line: 123, column: 5, scope: !50)
!66 = !DILocation(line: 124, column: 5, scope: !50)
!67 = !DILocation(line: 127, column: 5, scope: !50)
!68 = !DILocation(line: 128, column: 5, scope: !50)
!69 = !DILocation(line: 129, column: 5, scope: !50)
!70 = !DILocation(line: 131, column: 5, scope: !50)
!71 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 23, type: !72, scopeLine: 24, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!72 = !DISubroutineType(types: !73)
!73 = !{!53}
!74 = !DILocation(line: 25, column: 5, scope: !71)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 59, type: !13, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!76 = !DILocalVariable(name: "data", scope: !75, file: !12, line: 61, type: !17)
!77 = !DILocation(line: 61, column: 15, scope: !75)
!78 = !DILocalVariable(name: "dataBadBuffer", scope: !75, file: !12, line: 62, type: !23)
!79 = !DILocation(line: 62, column: 13, scope: !75)
!80 = !DILocalVariable(name: "dataGoodBuffer", scope: !75, file: !12, line: 63, type: !28)
!81 = !DILocation(line: 63, column: 13, scope: !75)
!82 = !DILocation(line: 64, column: 8, scope: !83)
!83 = distinct !DILexicalBlock(scope: !75, file: !12, line: 64, column: 8)
!84 = !DILocation(line: 64, column: 8, scope: !75)
!85 = !DILocation(line: 67, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !83, file: !12, line: 65, column: 5)
!87 = !DILocation(line: 68, column: 5, scope: !86)
!88 = !DILocation(line: 72, column: 16, scope: !89)
!89 = distinct !DILexicalBlock(scope: !83, file: !12, line: 70, column: 5)
!90 = !DILocation(line: 72, column: 14, scope: !89)
!91 = !DILocalVariable(name: "source", scope: !92, file: !12, line: 75, type: !28)
!92 = distinct !DILexicalBlock(scope: !75, file: !12, line: 74, column: 5)
!93 = !DILocation(line: 75, column: 17, scope: !92)
!94 = !DILocation(line: 77, column: 9, scope: !92)
!95 = !DILocation(line: 78, column: 27, scope: !92)
!96 = !DILocation(line: 78, column: 9, scope: !92)
!97 = !DILocation(line: 80, column: 1, scope: !75)
!98 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 28, type: !72, scopeLine: 29, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!99 = !DILocation(line: 30, column: 5, scope: !98)
!100 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!101 = !DILocalVariable(name: "data", scope: !100, file: !12, line: 85, type: !17)
!102 = !DILocation(line: 85, column: 15, scope: !100)
!103 = !DILocalVariable(name: "dataBadBuffer", scope: !100, file: !12, line: 86, type: !23)
!104 = !DILocation(line: 86, column: 13, scope: !100)
!105 = !DILocalVariable(name: "dataGoodBuffer", scope: !100, file: !12, line: 87, type: !28)
!106 = !DILocation(line: 87, column: 13, scope: !100)
!107 = !DILocation(line: 88, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !100, file: !12, line: 88, column: 8)
!109 = !DILocation(line: 88, column: 8, scope: !100)
!110 = !DILocation(line: 91, column: 16, scope: !111)
!111 = distinct !DILexicalBlock(scope: !108, file: !12, line: 89, column: 5)
!112 = !DILocation(line: 91, column: 14, scope: !111)
!113 = !DILocation(line: 92, column: 5, scope: !111)
!114 = !DILocalVariable(name: "source", scope: !115, file: !12, line: 94, type: !28)
!115 = distinct !DILexicalBlock(scope: !100, file: !12, line: 93, column: 5)
!116 = !DILocation(line: 94, column: 17, scope: !115)
!117 = !DILocation(line: 96, column: 9, scope: !115)
!118 = !DILocation(line: 97, column: 27, scope: !115)
!119 = !DILocation(line: 97, column: 9, scope: !115)
!120 = !DILocation(line: 99, column: 1, scope: !100)
