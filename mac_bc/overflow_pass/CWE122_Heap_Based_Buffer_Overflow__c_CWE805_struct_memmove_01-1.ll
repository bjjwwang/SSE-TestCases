; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_01-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_01-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_01_bad() #0 !dbg !20 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !25, metadata !DIExpression()), !dbg !26
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !27
  %call = call i8* @malloc(i64 noundef 400) #6, !dbg !28
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !29
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !30
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !31
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !37, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !50
  store i64 0, i64* %i, align 8, !dbg !51
  br label %for.cond, !dbg !53

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !54
  %cmp1 = icmp ult i64 %2, 100, !dbg !56
  br i1 %cmp1, label %for.body, label %for.end, !dbg !57

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !60
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !61
  store i32 0, i32* %intOne, align 8, !dbg !62
  %4 = load i64, i64* %i, align 8, !dbg !63
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !64
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !65
  store i32 0, i32* %intTwo, align 4, !dbg !66
  br label %for.inc, !dbg !67

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !68
  %inc = add i64 %5, 1, !dbg !68
  store i64 %inc, i64* %i, align 8, !dbg !68
  br label %for.cond, !dbg !69, !llvm.loop !70

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !73
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !73
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !73
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !73
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !73
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !73
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !73
  %call3 = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #8, !dbg !73
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !74
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !74
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !75
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !76
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !76
  call void @free(i8* noundef %14), !dbg !77
  ret void, !dbg !78
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #5

declare void @free(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_01_good() #0 !dbg !79 {
entry:
  call void @goodG2B(), !dbg !80
  ret void, !dbg !81
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !82 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !88, metadata !DIExpression()), !dbg !89
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !90, metadata !DIExpression()), !dbg !91
  %call = call i64 @time(i64* noundef null), !dbg !92
  %conv = trunc i64 %call to i32, !dbg !93
  call void @srand(i32 noundef %conv), !dbg !94
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !95
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_01_good(), !dbg !96
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !97
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !98
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_01_bad(), !dbg !99
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !100
  ret i32 0, !dbg !101
}

declare void @srand(i32 noundef) #5

declare i64 @time(i64* noundef) #5

declare void @printLine(i8* noundef) #5

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !102 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !103, metadata !DIExpression()), !dbg !104
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !105
  %call = call i8* @malloc(i64 noundef 800) #6, !dbg !106
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !107
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !108
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !109
  %cmp = icmp eq %struct._twoIntsStruct* %1, null, !dbg !111
  br i1 %cmp, label %if.then, label %if.end, !dbg !112

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #7, !dbg !113
  unreachable, !dbg !113

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !115, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i64* %i, metadata !118, metadata !DIExpression()), !dbg !120
  store i64 0, i64* %i, align 8, !dbg !121
  br label %for.cond, !dbg !123

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i64, i64* %i, align 8, !dbg !124
  %cmp1 = icmp ult i64 %2, 100, !dbg !126
  br i1 %cmp1, label %for.body, label %for.end, !dbg !127

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !130
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !131
  store i32 0, i32* %intOne, align 8, !dbg !132
  %4 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx2 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !134
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx2, i32 0, i32 1, !dbg !135
  store i32 0, i32* %intTwo, align 4, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %5, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !142
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !142
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !142
  %8 = bitcast %struct._twoIntsStruct* %arraydecay to i8*, !dbg !142
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !142
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !142
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !142
  %call3 = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #8, !dbg !142
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !143
  %arrayidx4 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !143
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx4), !dbg !144
  %13 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !145
  %14 = bitcast %struct._twoIntsStruct* %13 to i8*, !dbg !145
  call void @free(i8* noundef %14), !dbg !146
  ret void, !dbg !147
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { allocsize(0) }
attributes #7 = { noreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17, !18}
!llvm.ident = !{!19}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !11, !12}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !5, line: 100, baseType: !6)
!5 = !DIFile(filename: "src/overflow_pass/std_testcase.h", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!6 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !5, line: 96, size: 64, elements: !7)
!7 = !{!8, !10}
!8 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !6, file: !5, line: 98, baseType: !9, size: 32)
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !6, file: !5, line: 99, baseType: !9, size: 32, offset: 32)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"PIC Level", i32 2}
!17 = !{i32 7, !"uwtable", i32 1}
!18 = !{i32 7, !"frame-pointer", i32 2}
!19 = !{!"Homebrew clang version 14.0.6"}
!20 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_01_bad", scope: !21, file: !21, line: 21, type: !22, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!21 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_01-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!22 = !DISubroutineType(types: !23)
!23 = !{null}
!24 = !{}
!25 = !DILocalVariable(name: "data", scope: !20, file: !21, line: 23, type: !3)
!26 = !DILocation(line: 23, column: 21, scope: !20)
!27 = !DILocation(line: 24, column: 10, scope: !20)
!28 = !DILocation(line: 26, column: 29, scope: !20)
!29 = !DILocation(line: 26, column: 12, scope: !20)
!30 = !DILocation(line: 26, column: 10, scope: !20)
!31 = !DILocation(line: 27, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !20, file: !21, line: 27, column: 9)
!33 = !DILocation(line: 27, column: 14, scope: !32)
!34 = !DILocation(line: 27, column: 9, scope: !20)
!35 = !DILocation(line: 27, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !21, line: 27, column: 23)
!37 = !DILocalVariable(name: "source", scope: !38, file: !21, line: 29, type: !39)
!38 = distinct !DILexicalBlock(scope: !20, file: !21, line: 28, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 6400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 29, column: 23, scope: !38)
!43 = !DILocalVariable(name: "i", scope: !44, file: !21, line: 31, type: !45)
!44 = distinct !DILexicalBlock(scope: !38, file: !21, line: 30, column: 9)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !46, line: 31, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !48, line: 94, baseType: !49)
!48 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!49 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!50 = !DILocation(line: 31, column: 20, scope: !44)
!51 = !DILocation(line: 33, column: 20, scope: !52)
!52 = distinct !DILexicalBlock(scope: !44, file: !21, line: 33, column: 13)
!53 = !DILocation(line: 33, column: 18, scope: !52)
!54 = !DILocation(line: 33, column: 25, scope: !55)
!55 = distinct !DILexicalBlock(scope: !52, file: !21, line: 33, column: 13)
!56 = !DILocation(line: 33, column: 27, scope: !55)
!57 = !DILocation(line: 33, column: 13, scope: !52)
!58 = !DILocation(line: 35, column: 24, scope: !59)
!59 = distinct !DILexicalBlock(scope: !55, file: !21, line: 34, column: 13)
!60 = !DILocation(line: 35, column: 17, scope: !59)
!61 = !DILocation(line: 35, column: 27, scope: !59)
!62 = !DILocation(line: 35, column: 34, scope: !59)
!63 = !DILocation(line: 36, column: 24, scope: !59)
!64 = !DILocation(line: 36, column: 17, scope: !59)
!65 = !DILocation(line: 36, column: 27, scope: !59)
!66 = !DILocation(line: 36, column: 34, scope: !59)
!67 = !DILocation(line: 37, column: 13, scope: !59)
!68 = !DILocation(line: 33, column: 35, scope: !55)
!69 = !DILocation(line: 33, column: 13, scope: !55)
!70 = distinct !{!70, !57, !71, !72}
!71 = !DILocation(line: 37, column: 13, scope: !52)
!72 = !{!"llvm.loop.mustprogress"}
!73 = !DILocation(line: 40, column: 9, scope: !38)
!74 = !DILocation(line: 41, column: 26, scope: !38)
!75 = !DILocation(line: 41, column: 9, scope: !38)
!76 = !DILocation(line: 42, column: 14, scope: !38)
!77 = !DILocation(line: 42, column: 9, scope: !38)
!78 = !DILocation(line: 44, column: 1, scope: !20)
!79 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_01_good", scope: !21, file: !21, line: 76, type: !22, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!80 = !DILocation(line: 78, column: 5, scope: !79)
!81 = !DILocation(line: 79, column: 1, scope: !79)
!82 = distinct !DISubprogram(name: "main", scope: !21, file: !21, line: 91, type: !83, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !24)
!83 = !DISubroutineType(types: !84)
!84 = !{!9, !9, !85}
!85 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!88 = !DILocalVariable(name: "argc", arg: 1, scope: !82, file: !21, line: 91, type: !9)
!89 = !DILocation(line: 91, column: 14, scope: !82)
!90 = !DILocalVariable(name: "argv", arg: 2, scope: !82, file: !21, line: 91, type: !85)
!91 = !DILocation(line: 91, column: 27, scope: !82)
!92 = !DILocation(line: 94, column: 22, scope: !82)
!93 = !DILocation(line: 94, column: 12, scope: !82)
!94 = !DILocation(line: 94, column: 5, scope: !82)
!95 = !DILocation(line: 96, column: 5, scope: !82)
!96 = !DILocation(line: 97, column: 5, scope: !82)
!97 = !DILocation(line: 98, column: 5, scope: !82)
!98 = !DILocation(line: 101, column: 5, scope: !82)
!99 = !DILocation(line: 102, column: 5, scope: !82)
!100 = !DILocation(line: 103, column: 5, scope: !82)
!101 = !DILocation(line: 105, column: 5, scope: !82)
!102 = distinct !DISubprogram(name: "goodG2B", scope: !21, file: !21, line: 51, type: !22, scopeLine: 52, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !24)
!103 = !DILocalVariable(name: "data", scope: !102, file: !21, line: 53, type: !3)
!104 = !DILocation(line: 53, column: 21, scope: !102)
!105 = !DILocation(line: 54, column: 10, scope: !102)
!106 = !DILocation(line: 56, column: 29, scope: !102)
!107 = !DILocation(line: 56, column: 12, scope: !102)
!108 = !DILocation(line: 56, column: 10, scope: !102)
!109 = !DILocation(line: 57, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !21, line: 57, column: 9)
!111 = !DILocation(line: 57, column: 14, scope: !110)
!112 = !DILocation(line: 57, column: 9, scope: !102)
!113 = !DILocation(line: 57, column: 24, scope: !114)
!114 = distinct !DILexicalBlock(scope: !110, file: !21, line: 57, column: 23)
!115 = !DILocalVariable(name: "source", scope: !116, file: !21, line: 59, type: !39)
!116 = distinct !DILexicalBlock(scope: !102, file: !21, line: 58, column: 5)
!117 = !DILocation(line: 59, column: 23, scope: !116)
!118 = !DILocalVariable(name: "i", scope: !119, file: !21, line: 61, type: !45)
!119 = distinct !DILexicalBlock(scope: !116, file: !21, line: 60, column: 9)
!120 = !DILocation(line: 61, column: 20, scope: !119)
!121 = !DILocation(line: 63, column: 20, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !21, line: 63, column: 13)
!123 = !DILocation(line: 63, column: 18, scope: !122)
!124 = !DILocation(line: 63, column: 25, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !21, line: 63, column: 13)
!126 = !DILocation(line: 63, column: 27, scope: !125)
!127 = !DILocation(line: 63, column: 13, scope: !122)
!128 = !DILocation(line: 65, column: 24, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !21, line: 64, column: 13)
!130 = !DILocation(line: 65, column: 17, scope: !129)
!131 = !DILocation(line: 65, column: 27, scope: !129)
!132 = !DILocation(line: 65, column: 34, scope: !129)
!133 = !DILocation(line: 66, column: 24, scope: !129)
!134 = !DILocation(line: 66, column: 17, scope: !129)
!135 = !DILocation(line: 66, column: 27, scope: !129)
!136 = !DILocation(line: 66, column: 34, scope: !129)
!137 = !DILocation(line: 67, column: 13, scope: !129)
!138 = !DILocation(line: 63, column: 35, scope: !125)
!139 = !DILocation(line: 63, column: 13, scope: !125)
!140 = distinct !{!140, !127, !141, !72}
!141 = !DILocation(line: 67, column: 13, scope: !122)
!142 = !DILocation(line: 70, column: 9, scope: !116)
!143 = !DILocation(line: 71, column: 26, scope: !116)
!144 = !DILocation(line: 71, column: 9, scope: !116)
!145 = !DILocation(line: 72, column: 14, scope: !116)
!146 = !DILocation(line: 72, column: 9, scope: !116)
!147 = !DILocation(line: 74, column: 1, scope: !102)
