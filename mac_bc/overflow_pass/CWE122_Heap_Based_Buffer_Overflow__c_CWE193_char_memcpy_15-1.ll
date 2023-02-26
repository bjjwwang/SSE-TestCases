; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_15-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_15-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_15_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B1.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@__const.goodG2B2.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_15_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* null, i8** %data, align 8, !dbg !21
  %call = call i8* @malloc(i64 noundef 10) #7, !dbg !22
  store i8* %call, i8** %data, align 8, !dbg !23
  %0 = load i8*, i8** %data, align 8, !dbg !24
  %cmp = icmp eq i8* %0, null, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !28
  unreachable, !dbg !28

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !30, metadata !DIExpression()), !dbg !35
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !35
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_15_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !35
  %2 = load i8*, i8** %data, align 8, !dbg !36
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !36
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !36
  %call2 = call i64 @strlen(i8* noundef %arraydecay1), !dbg !36
  %add = add i64 %call2, 1, !dbg !36
  %mul = mul i64 %add, 1, !dbg !36
  %3 = load i8*, i8** %data, align 8, !dbg !36
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !36
  %call3 = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %4) #9, !dbg !36
  %5 = load i8*, i8** %data, align 8, !dbg !37
  call void @printLine(i8* noundef %5), !dbg !38
  %6 = load i8*, i8** %data, align 8, !dbg !39
  call void @free(i8* noundef %6), !dbg !40
  ret void, !dbg !41
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__memcpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

declare i64 @strlen(i8* noundef) #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_15_good() #0 !dbg !42 {
entry:
  call void @goodG2B1(), !dbg !43
  call void @goodG2B2(), !dbg !44
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !51, metadata !DIExpression()), !dbg !52
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !53, metadata !DIExpression()), !dbg !54
  %call = call i64 @time(i64* noundef null), !dbg !55
  %conv = trunc i64 %call to i32, !dbg !56
  call void @srand(i32 noundef %conv), !dbg !57
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_15_good(), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !60
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !61
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_15_bad(), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !63
  ret i32 0, !dbg !64
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !65 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  store i8* null, i8** %data, align 8, !dbg !68
  %call = call i8* @malloc(i64 noundef 11) #7, !dbg !69
  store i8* %call, i8** %data, align 8, !dbg !70
  %0 = load i8*, i8** %data, align 8, !dbg !71
  %cmp = icmp eq i8* %0, null, !dbg !73
  br i1 %cmp, label %if.then, label %if.end, !dbg !74

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !75
  unreachable, !dbg !75

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !77, metadata !DIExpression()), !dbg !79
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !79
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B1.source, i32 0, i32 0), i64 11, i1 false), !dbg !79
  %2 = load i8*, i8** %data, align 8, !dbg !80
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !80
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !80
  %call2 = call i64 @strlen(i8* noundef %arraydecay1), !dbg !80
  %add = add i64 %call2, 1, !dbg !80
  %mul = mul i64 %add, 1, !dbg !80
  %3 = load i8*, i8** %data, align 8, !dbg !80
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !80
  %call3 = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %4) #9, !dbg !80
  %5 = load i8*, i8** %data, align 8, !dbg !81
  call void @printLine(i8* noundef %5), !dbg !82
  %6 = load i8*, i8** %data, align 8, !dbg !83
  call void @free(i8* noundef %6), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !86 {
entry:
  %data = alloca i8*, align 8
  %source = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !87, metadata !DIExpression()), !dbg !88
  store i8* null, i8** %data, align 8, !dbg !89
  %call = call i8* @malloc(i64 noundef 11) #7, !dbg !90
  store i8* %call, i8** %data, align 8, !dbg !91
  %0 = load i8*, i8** %data, align 8, !dbg !92
  %cmp = icmp eq i8* %0, null, !dbg !94
  br i1 %cmp, label %if.then, label %if.end, !dbg !95

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !96
  unreachable, !dbg !96

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [11 x i8]* %source, metadata !98, metadata !DIExpression()), !dbg !100
  %1 = bitcast [11 x i8]* %source to i8*, !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B2.source, i32 0, i32 0), i64 11, i1 false), !dbg !100
  %2 = load i8*, i8** %data, align 8, !dbg !101
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !101
  %arraydecay1 = getelementptr inbounds [11 x i8], [11 x i8]* %source, i64 0, i64 0, !dbg !101
  %call2 = call i64 @strlen(i8* noundef %arraydecay1), !dbg !101
  %add = add i64 %call2, 1, !dbg !101
  %mul = mul i64 %add, 1, !dbg !101
  %3 = load i8*, i8** %data, align 8, !dbg !101
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !101
  %call3 = call i8* @__memcpy_chk(i8* noundef %2, i8* noundef %arraydecay, i64 noundef %mul, i64 noundef %4) #9, !dbg !101
  %5 = load i8*, i8** %data, align 8, !dbg !102
  call void @printLine(i8* noundef %5), !dbg !103
  %6 = load i8*, i8** %data, align 8, !dbg !104
  call void @free(i8* noundef %6), !dbg !105
  ret void, !dbg !106
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_15_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_15-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !3)
!20 = !DILocation(line: 30, column: 12, scope: !14)
!21 = !DILocation(line: 31, column: 10, scope: !14)
!22 = !DILocation(line: 36, column: 24, scope: !14)
!23 = !DILocation(line: 36, column: 14, scope: !14)
!24 = !DILocation(line: 37, column: 13, scope: !25)
!25 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 13)
!26 = !DILocation(line: 37, column: 18, scope: !25)
!27 = !DILocation(line: 37, column: 13, scope: !14)
!28 = !DILocation(line: 37, column: 28, scope: !29)
!29 = distinct !DILexicalBlock(scope: !25, file: !15, line: 37, column: 27)
!30 = !DILocalVariable(name: "source", scope: !31, file: !15, line: 45, type: !32)
!31 = distinct !DILexicalBlock(scope: !14, file: !15, line: 44, column: 5)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DILocation(line: 45, column: 14, scope: !31)
!36 = !DILocation(line: 48, column: 9, scope: !31)
!37 = !DILocation(line: 49, column: 19, scope: !31)
!38 = !DILocation(line: 49, column: 9, scope: !31)
!39 = !DILocation(line: 50, column: 14, scope: !31)
!40 = !DILocation(line: 50, column: 9, scope: !31)
!41 = !DILocation(line: 52, column: 1, scope: !14)
!42 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memcpy_15_good", scope: !15, file: !15, line: 112, type: !16, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!43 = !DILocation(line: 114, column: 5, scope: !42)
!44 = !DILocation(line: 115, column: 5, scope: !42)
!45 = !DILocation(line: 116, column: 1, scope: !42)
!46 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 128, type: !47, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!47 = !DISubroutineType(types: !48)
!48 = !{!49, !49, !50}
!49 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!51 = !DILocalVariable(name: "argc", arg: 1, scope: !46, file: !15, line: 128, type: !49)
!52 = !DILocation(line: 128, column: 14, scope: !46)
!53 = !DILocalVariable(name: "argv", arg: 2, scope: !46, file: !15, line: 128, type: !50)
!54 = !DILocation(line: 128, column: 27, scope: !46)
!55 = !DILocation(line: 131, column: 22, scope: !46)
!56 = !DILocation(line: 131, column: 12, scope: !46)
!57 = !DILocation(line: 131, column: 5, scope: !46)
!58 = !DILocation(line: 133, column: 5, scope: !46)
!59 = !DILocation(line: 134, column: 5, scope: !46)
!60 = !DILocation(line: 135, column: 5, scope: !46)
!61 = !DILocation(line: 138, column: 5, scope: !46)
!62 = !DILocation(line: 139, column: 5, scope: !46)
!63 = !DILocation(line: 140, column: 5, scope: !46)
!64 = !DILocation(line: 142, column: 5, scope: !46)
!65 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 59, type: !16, scopeLine: 60, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!66 = !DILocalVariable(name: "data", scope: !65, file: !15, line: 61, type: !3)
!67 = !DILocation(line: 61, column: 12, scope: !65)
!68 = !DILocation(line: 62, column: 10, scope: !65)
!69 = !DILocation(line: 71, column: 24, scope: !65)
!70 = !DILocation(line: 71, column: 14, scope: !65)
!71 = !DILocation(line: 72, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !65, file: !15, line: 72, column: 13)
!73 = !DILocation(line: 72, column: 18, scope: !72)
!74 = !DILocation(line: 72, column: 13, scope: !65)
!75 = !DILocation(line: 72, column: 28, scope: !76)
!76 = distinct !DILexicalBlock(scope: !72, file: !15, line: 72, column: 27)
!77 = !DILocalVariable(name: "source", scope: !78, file: !15, line: 76, type: !32)
!78 = distinct !DILexicalBlock(scope: !65, file: !15, line: 75, column: 5)
!79 = !DILocation(line: 76, column: 14, scope: !78)
!80 = !DILocation(line: 79, column: 9, scope: !78)
!81 = !DILocation(line: 80, column: 19, scope: !78)
!82 = !DILocation(line: 80, column: 9, scope: !78)
!83 = !DILocation(line: 81, column: 14, scope: !78)
!84 = !DILocation(line: 81, column: 9, scope: !78)
!85 = !DILocation(line: 83, column: 1, scope: !65)
!86 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 86, type: !16, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!87 = !DILocalVariable(name: "data", scope: !86, file: !15, line: 88, type: !3)
!88 = !DILocation(line: 88, column: 12, scope: !86)
!89 = !DILocation(line: 89, column: 10, scope: !86)
!90 = !DILocation(line: 94, column: 24, scope: !86)
!91 = !DILocation(line: 94, column: 14, scope: !86)
!92 = !DILocation(line: 95, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !86, file: !15, line: 95, column: 13)
!94 = !DILocation(line: 95, column: 18, scope: !93)
!95 = !DILocation(line: 95, column: 13, scope: !86)
!96 = !DILocation(line: 95, column: 28, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !15, line: 95, column: 27)
!98 = !DILocalVariable(name: "source", scope: !99, file: !15, line: 103, type: !32)
!99 = distinct !DILexicalBlock(scope: !86, file: !15, line: 102, column: 5)
!100 = !DILocation(line: 103, column: 14, scope: !99)
!101 = !DILocation(line: 106, column: 9, scope: !99)
!102 = !DILocation(line: 107, column: 19, scope: !99)
!103 = !DILocation(line: 107, column: 9, scope: !99)
!104 = !DILocation(line: 108, column: 14, scope: !99)
!105 = !DILocation(line: 108, column: 9, scope: !99)
!106 = !DILocation(line: 110, column: 1, scope: !86)
