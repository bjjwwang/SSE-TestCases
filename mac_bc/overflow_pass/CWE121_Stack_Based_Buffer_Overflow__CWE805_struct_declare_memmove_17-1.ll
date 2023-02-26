; ModuleID = 'mac_bc/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i1 = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %i, metadata !16, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !19, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !28, metadata !DIExpression()), !dbg !32
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !33, metadata !DIExpression()), !dbg !37
  store i32 0, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !41
  %cmp = icmp slt i32 %0, 1, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [50 x %struct._twoIntsStruct], [50 x %struct._twoIntsStruct]* %dataBadBuffer, i64 0, i64 0, !dbg !45
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %1, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !54, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %i1, metadata !57, metadata !DIExpression()), !dbg !64
  store i64 0, i64* %i1, align 8, !dbg !65
  br label %for.cond2, !dbg !67

for.cond2:                                        ; preds = %for.inc6, %for.end
  %2 = load i64, i64* %i1, align 8, !dbg !68
  %cmp3 = icmp ult i64 %2, 100, !dbg !70
  br i1 %cmp3, label %for.body4, label %for.end8, !dbg !71

for.body4:                                        ; preds = %for.cond2
  %3 = load i64, i64* %i1, align 8, !dbg !72
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !74
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !75
  store i32 0, i32* %intOne, align 8, !dbg !76
  %4 = load i64, i64* %i1, align 8, !dbg !77
  %arrayidx5 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !78
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx5, i32 0, i32 1, !dbg !79
  store i32 0, i32* %intTwo, align 4, !dbg !80
  br label %for.inc6, !dbg !81

for.inc6:                                         ; preds = %for.body4
  %5 = load i64, i64* %i1, align 8, !dbg !82
  %inc7 = add i64 %5, 1, !dbg !82
  store i64 %inc7, i64* %i1, align 8, !dbg !82
  br label %for.cond2, !dbg !83, !llvm.loop !84

for.end8:                                         ; preds = %for.cond2
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !86
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !86
  %arraydecay9 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !86
  %8 = bitcast %struct._twoIntsStruct* %arraydecay9 to i8*, !dbg !86
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !86
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !86
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !86
  %call = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #4, !dbg !86
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !87
  %arrayidx10 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !87
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx10), !dbg !88
  ret void, !dbg !89
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printStructLine(%struct._twoIntsStruct* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17_good() #0 !dbg !90 {
entry:
  call void @goodG2B(), !dbg !91
  ret void, !dbg !92
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !93 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !99, metadata !DIExpression()), !dbg !100
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %call = call i64 @time(i64* noundef null), !dbg !103
  %conv = trunc i64 %call to i32, !dbg !104
  call void @srand(i32 noundef %conv), !dbg !105
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !106
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17_good(), !dbg !107
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !108
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !109
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17_bad(), !dbg !110
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !111
  ret i32 0, !dbg !112
}

declare void @srand(i32 noundef) #3

declare i64 @time(i64* noundef) #3

declare void @printLine(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !113 {
entry:
  %h = alloca i32, align 4
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataBadBuffer = alloca [50 x %struct._twoIntsStruct], align 16
  %dataGoodBuffer = alloca [100 x %struct._twoIntsStruct], align 16
  %source = alloca [100 x %struct._twoIntsStruct], align 16
  %i = alloca i64, align 8
  call void @llvm.dbg.declare(metadata i32* %h, metadata !114, metadata !DIExpression()), !dbg !115
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [50 x %struct._twoIntsStruct]* %dataBadBuffer, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %dataGoodBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  store i32 0, i32* %h, align 4, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !125
  %cmp = icmp slt i32 %0, 1, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %dataGoodBuffer, i64 0, i64 0, !dbg !129
  store %struct._twoIntsStruct* %arraydecay, %struct._twoIntsStruct** %data, align 8, !dbg !131
  br label %for.inc, !dbg !132

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !133
  %inc = add nsw i32 %1, 1, !dbg !133
  store i32 %inc, i32* %h, align 4, !dbg !133
  br label %for.cond, !dbg !134, !llvm.loop !135

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata [100 x %struct._twoIntsStruct]* %source, metadata !137, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.declare(metadata i64* %i, metadata !140, metadata !DIExpression()), !dbg !142
  store i64 0, i64* %i, align 8, !dbg !143
  br label %for.cond1, !dbg !145

for.cond1:                                        ; preds = %for.inc5, %for.end
  %2 = load i64, i64* %i, align 8, !dbg !146
  %cmp2 = icmp ult i64 %2, 100, !dbg !148
  br i1 %cmp2, label %for.body3, label %for.end7, !dbg !149

for.body3:                                        ; preds = %for.cond1
  %3 = load i64, i64* %i, align 8, !dbg !150
  %arrayidx = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %3, !dbg !152
  %intOne = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx, i32 0, i32 0, !dbg !153
  store i32 0, i32* %intOne, align 8, !dbg !154
  %4 = load i64, i64* %i, align 8, !dbg !155
  %arrayidx4 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 %4, !dbg !156
  %intTwo = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %arrayidx4, i32 0, i32 1, !dbg !157
  store i32 0, i32* %intTwo, align 4, !dbg !158
  br label %for.inc5, !dbg !159

for.inc5:                                         ; preds = %for.body3
  %5 = load i64, i64* %i, align 8, !dbg !160
  %inc6 = add i64 %5, 1, !dbg !160
  store i64 %inc6, i64* %i, align 8, !dbg !160
  br label %for.cond1, !dbg !161, !llvm.loop !162

for.end7:                                         ; preds = %for.cond1
  %6 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !164
  %7 = bitcast %struct._twoIntsStruct* %6 to i8*, !dbg !164
  %arraydecay8 = getelementptr inbounds [100 x %struct._twoIntsStruct], [100 x %struct._twoIntsStruct]* %source, i64 0, i64 0, !dbg !164
  %8 = bitcast %struct._twoIntsStruct* %arraydecay8 to i8*, !dbg !164
  %9 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !164
  %10 = bitcast %struct._twoIntsStruct* %9 to i8*, !dbg !164
  %11 = call i64 @llvm.objectsize.i64.p0i8(i8* %10, i1 false, i1 true, i1 false), !dbg !164
  %call = call i8* @__memmove_chk(i8* noundef %7, i8* noundef %8, i64 noundef 800, i64 noundef %11) #4, !dbg !164
  %12 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !165
  %arrayidx9 = getelementptr inbounds %struct._twoIntsStruct, %struct._twoIntsStruct* %12, i64 0, !dbg !165
  call void @printStructLine(%struct._twoIntsStruct* noundef %arrayidx9), !dbg !166
  ret void, !dbg !167
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3}
!3 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17_bad", scope: !12, file: !12, line: 21, type: !13, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!12 = !DIFile(filename: "src/overflow_pass/CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !{}
!16 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 23, type: !17)
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 23, column: 9, scope: !11)
!19 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 24, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !22, line: 100, baseType: !23)
!22 = !DIFile(filename: "src/overflow_pass/std_testcase.h", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !22, line: 96, size: 64, elements: !24)
!24 = !{!25, !26}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !23, file: !22, line: 98, baseType: !17, size: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !23, file: !22, line: 99, baseType: !17, size: 32, offset: 32)
!27 = !DILocation(line: 24, column: 21, scope: !11)
!28 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 25, type: !29)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 50)
!32 = !DILocation(line: 25, column: 19, scope: !11)
!33 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 26, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 6400, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 100)
!37 = !DILocation(line: 26, column: 19, scope: !11)
!38 = !DILocation(line: 27, column: 11, scope: !39)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 27, column: 5)
!40 = !DILocation(line: 27, column: 9, scope: !39)
!41 = !DILocation(line: 27, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !12, line: 27, column: 5)
!43 = !DILocation(line: 27, column: 18, scope: !42)
!44 = !DILocation(line: 27, column: 5, scope: !39)
!45 = !DILocation(line: 31, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 28, column: 5)
!47 = !DILocation(line: 31, column: 14, scope: !46)
!48 = !DILocation(line: 32, column: 5, scope: !46)
!49 = !DILocation(line: 27, column: 24, scope: !42)
!50 = !DILocation(line: 27, column: 5, scope: !42)
!51 = distinct !{!51, !44, !52, !53}
!52 = !DILocation(line: 32, column: 5, scope: !39)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocalVariable(name: "source", scope: !55, file: !12, line: 34, type: !34)
!55 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!56 = !DILocation(line: 34, column: 23, scope: !55)
!57 = !DILocalVariable(name: "i", scope: !58, file: !12, line: 36, type: !59)
!58 = distinct !DILexicalBlock(scope: !55, file: !12, line: 35, column: 9)
!59 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !60, line: 31, baseType: !61)
!60 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types/_size_t.h", directory: "")
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_size_t", file: !62, line: 94, baseType: !63)
!62 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/i386/_types.h", directory: "")
!63 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!64 = !DILocation(line: 36, column: 20, scope: !58)
!65 = !DILocation(line: 38, column: 20, scope: !66)
!66 = distinct !DILexicalBlock(scope: !58, file: !12, line: 38, column: 13)
!67 = !DILocation(line: 38, column: 18, scope: !66)
!68 = !DILocation(line: 38, column: 25, scope: !69)
!69 = distinct !DILexicalBlock(scope: !66, file: !12, line: 38, column: 13)
!70 = !DILocation(line: 38, column: 27, scope: !69)
!71 = !DILocation(line: 38, column: 13, scope: !66)
!72 = !DILocation(line: 40, column: 24, scope: !73)
!73 = distinct !DILexicalBlock(scope: !69, file: !12, line: 39, column: 13)
!74 = !DILocation(line: 40, column: 17, scope: !73)
!75 = !DILocation(line: 40, column: 27, scope: !73)
!76 = !DILocation(line: 40, column: 34, scope: !73)
!77 = !DILocation(line: 41, column: 24, scope: !73)
!78 = !DILocation(line: 41, column: 17, scope: !73)
!79 = !DILocation(line: 41, column: 27, scope: !73)
!80 = !DILocation(line: 41, column: 34, scope: !73)
!81 = !DILocation(line: 42, column: 13, scope: !73)
!82 = !DILocation(line: 38, column: 35, scope: !69)
!83 = !DILocation(line: 38, column: 13, scope: !69)
!84 = distinct !{!84, !71, !85, !53}
!85 = !DILocation(line: 42, column: 13, scope: !66)
!86 = !DILocation(line: 45, column: 9, scope: !55)
!87 = !DILocation(line: 46, column: 26, scope: !55)
!88 = !DILocation(line: 46, column: 9, scope: !55)
!89 = !DILocation(line: 48, column: 1, scope: !11)
!90 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE805_struct_declare_memmove_17_good", scope: !12, file: !12, line: 83, type: !13, scopeLine: 84, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!91 = !DILocation(line: 85, column: 5, scope: !90)
!92 = !DILocation(line: 86, column: 1, scope: !90)
!93 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 98, type: !94, scopeLine: 99, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !15)
!94 = !DISubroutineType(types: !95)
!95 = !{!17, !17, !96}
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!98 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!99 = !DILocalVariable(name: "argc", arg: 1, scope: !93, file: !12, line: 98, type: !17)
!100 = !DILocation(line: 98, column: 14, scope: !93)
!101 = !DILocalVariable(name: "argv", arg: 2, scope: !93, file: !12, line: 98, type: !96)
!102 = !DILocation(line: 98, column: 27, scope: !93)
!103 = !DILocation(line: 101, column: 22, scope: !93)
!104 = !DILocation(line: 101, column: 12, scope: !93)
!105 = !DILocation(line: 101, column: 5, scope: !93)
!106 = !DILocation(line: 103, column: 5, scope: !93)
!107 = !DILocation(line: 104, column: 5, scope: !93)
!108 = !DILocation(line: 105, column: 5, scope: !93)
!109 = !DILocation(line: 108, column: 5, scope: !93)
!110 = !DILocation(line: 109, column: 5, scope: !93)
!111 = !DILocation(line: 110, column: 5, scope: !93)
!112 = !DILocation(line: 112, column: 5, scope: !93)
!113 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !15)
!114 = !DILocalVariable(name: "h", scope: !113, file: !12, line: 57, type: !17)
!115 = !DILocation(line: 57, column: 9, scope: !113)
!116 = !DILocalVariable(name: "data", scope: !113, file: !12, line: 58, type: !20)
!117 = !DILocation(line: 58, column: 21, scope: !113)
!118 = !DILocalVariable(name: "dataBadBuffer", scope: !113, file: !12, line: 59, type: !29)
!119 = !DILocation(line: 59, column: 19, scope: !113)
!120 = !DILocalVariable(name: "dataGoodBuffer", scope: !113, file: !12, line: 60, type: !34)
!121 = !DILocation(line: 60, column: 19, scope: !113)
!122 = !DILocation(line: 61, column: 11, scope: !123)
!123 = distinct !DILexicalBlock(scope: !113, file: !12, line: 61, column: 5)
!124 = !DILocation(line: 61, column: 9, scope: !123)
!125 = !DILocation(line: 61, column: 16, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !12, line: 61, column: 5)
!127 = !DILocation(line: 61, column: 18, scope: !126)
!128 = !DILocation(line: 61, column: 5, scope: !123)
!129 = !DILocation(line: 64, column: 16, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !12, line: 62, column: 5)
!131 = !DILocation(line: 64, column: 14, scope: !130)
!132 = !DILocation(line: 65, column: 5, scope: !130)
!133 = !DILocation(line: 61, column: 24, scope: !126)
!134 = !DILocation(line: 61, column: 5, scope: !126)
!135 = distinct !{!135, !128, !136, !53}
!136 = !DILocation(line: 65, column: 5, scope: !123)
!137 = !DILocalVariable(name: "source", scope: !138, file: !12, line: 67, type: !34)
!138 = distinct !DILexicalBlock(scope: !113, file: !12, line: 66, column: 5)
!139 = !DILocation(line: 67, column: 23, scope: !138)
!140 = !DILocalVariable(name: "i", scope: !141, file: !12, line: 69, type: !59)
!141 = distinct !DILexicalBlock(scope: !138, file: !12, line: 68, column: 9)
!142 = !DILocation(line: 69, column: 20, scope: !141)
!143 = !DILocation(line: 71, column: 20, scope: !144)
!144 = distinct !DILexicalBlock(scope: !141, file: !12, line: 71, column: 13)
!145 = !DILocation(line: 71, column: 18, scope: !144)
!146 = !DILocation(line: 71, column: 25, scope: !147)
!147 = distinct !DILexicalBlock(scope: !144, file: !12, line: 71, column: 13)
!148 = !DILocation(line: 71, column: 27, scope: !147)
!149 = !DILocation(line: 71, column: 13, scope: !144)
!150 = !DILocation(line: 73, column: 24, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !12, line: 72, column: 13)
!152 = !DILocation(line: 73, column: 17, scope: !151)
!153 = !DILocation(line: 73, column: 27, scope: !151)
!154 = !DILocation(line: 73, column: 34, scope: !151)
!155 = !DILocation(line: 74, column: 24, scope: !151)
!156 = !DILocation(line: 74, column: 17, scope: !151)
!157 = !DILocation(line: 74, column: 27, scope: !151)
!158 = !DILocation(line: 74, column: 34, scope: !151)
!159 = !DILocation(line: 75, column: 13, scope: !151)
!160 = !DILocation(line: 71, column: 35, scope: !147)
!161 = !DILocation(line: 71, column: 13, scope: !147)
!162 = distinct !{!162, !149, !163, !53}
!163 = !DILocation(line: 75, column: 13, scope: !144)
!164 = !DILocation(line: 78, column: 9, scope: !138)
!165 = !DILocation(line: 79, column: 26, scope: !138)
!166 = !DILocation(line: 79, column: 9, scope: !138)
!167 = !DILocation(line: 81, column: 1, scope: !113)
